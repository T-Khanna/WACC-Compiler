package backEnd;

import backEnd.instructions.Directive;
import backEnd.instructions.Instruction;
import backEnd.instructions.Label;
import frontEnd.ArrayType;
import frontEnd.Identifier;
import frontEnd.PairType;
import frontEnd.Type;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Dictionary;
import java.util.Hashtable;

import static frontEnd.AllTypes.*;

public class Data {

    private Deque<Instruction> messages;
    private Dictionary<String, Label> messageLocations;
    private Dictionary<Type, Label> formatSpecifiers;
    private int messageIndex;
    private boolean hasStringMessage, hasIntMessage;

    public Data() {
        messages = new ArrayDeque<>();
        messageLocations = new Hashtable<>();
        formatSpecifiers = new Hashtable<>();
        messageIndex = 0;
    }

    public Label getFormatSpecifier(Type type) {
        Type checkType = type;
        if (type instanceof ArrayType || type instanceof PairType) {
            checkType = NULL;
        }
        Label msg = formatSpecifiers.get(checkType);
        if (msg != null) {
            return msg;
        } else {
            return addFormatSpecifier(type);
        }
    }

    private Label addMessage(Identifier ident) {
        if (isEmpty()) {
            messages.add(new Directive("data"));
        }

        Type exprType = ident.getType();

        if (exprType.equalsType(INT) && !hasIntMessage) {
            hasIntMessage = true;
            addFormatSpecifiers();
            return null;
        }

        Label msg = new Label("msg_", messageIndex++, false);
        String liter = ident.getVal();

        if (exprType.equalsType(STRING)) {
            int size = liter.length();
            if (liter.equals("\\0")) {
                size--;
            }
            messages.add(msg);
            messages.add(new Directive("word " + size));
            messages.add(new Directive("ascii \"" + liter + "\""));

            if (!hasStringMessage) {
                hasStringMessage = true;
            }
        }

        if (exprType.equalsType(BOOL)) {
            messages.add(msg);
            messages.add(new Directive("word " + (liter.length() - 1)));
            messages.add(new Directive("ascii \"" + liter + "\""));
        }

        messageLocations.put(liter, msg);

        addFormatSpecifiers();

        return msg;
    }

    public Label getMessageLocation(Identifier ident) {
        Label result = messageLocations.get(ident.getVal());
        if (result != null) {
            return result;
        } else {
            return addMessage(ident);
        }
    }

    public Label addFormatSpecifier(Type type) {
        Label msg = new Label("msg_", messageIndex++, false);
        messages.add(msg);

        if (type.equalsType(INT)) {
            String intFormat = "%d\\0";
            messages.add(new Directive("word " + (intFormat.length() - 1)));
            messages.add(new Directive("ascii \"" + intFormat + "\""));
            formatSpecifiers.put(INT, msg);
        }

        if (type.equalsType(STRING)) {
            String strFormat = "%.*s\\0";
            messages.add(new Directive("word " + (strFormat.length() - 1)));
            messages.add(new Directive("ascii \"" + strFormat + "\""));
            formatSpecifiers.put(STRING, msg);
        }

        if (type.equalsType(CHAR)) {
            String charFormat = " %c\\0";
            messages.add(new Directive("word " + (charFormat.length() - 1)));
            messages.add(new Directive("ascii \"" + charFormat + "\""));
            formatSpecifiers.put(CHAR, msg);
        }

        if (type instanceof PairType || type instanceof ArrayType) {
            String refFormat = "%p\\0";
            messages.add(new Directive("word " + (refFormat.length() - 1)));
            messages.add(new Directive("ascii\"" + refFormat + "\""));
            formatSpecifiers.put(NULL, msg);
        }

        return msg;

    }

    private void addFormatSpecifiers() {
        if (hasStringMessage && getFormatSpecifier(STRING) == null) {
            addFormatSpecifier(STRING);
        }
        if (hasIntMessage && getFormatSpecifier(INT) == null) {
            addFormatSpecifier(INT);
        }
    }

    public Deque<Instruction> getData() {
        return messages;
    }

    public boolean isEmpty() {
        return messages.size() == 0;
    }

}
