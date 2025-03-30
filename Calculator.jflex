import java_cup.runtime.*;

%%

%class CalculatorLexer
%cup
%unicode
%line
%column
%public

%{
    // Make fullExpression accessible to the parser
    public static StringBuilder fullExpression = new StringBuilder();

    private void add_to_expression(String text) {
        fullExpression.append(text);
    }

    private Symbol symbol(int type) {
        return new Symbol(type);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, value);
    }
%}

NUMBER      = [0-9]+(\.[0-9]+)?
PI          = "PI" | "pi"
EXIT        = "EXIT" | "exit"
CLEAR       = "CLEAR" | "clear"
HISTORY     = "HISTORY" | "history"
SQRT        = "sqrt"
MOD         = "mod"
SIN         = "sin"
COS         = "cos"
TAN         = "tan"
VARIABLE    = [a-zA-Z]
MODULO      = "%"
NEWLINE     = \n|\r\n
WHITESPACE  = [ \t]+

%%

{NUMBER}        { add_to_expression(yytext()); return symbol(sym.NUMBER, Double.parseDouble(yytext())); }
{PI}            { add_to_expression(yytext()); return symbol(sym.PI); }
{EXIT}          { return symbol(sym.EXIT); }
{CLEAR}         { return symbol(sym.CLEAR); }
{HISTORY}       { return symbol(sym.HISTORY); }
{SQRT}          { add_to_expression(yytext()); return symbol(sym.SQRT); }
{MOD}           { add_to_expression(yytext()); return symbol(sym.MOD); }
{SIN}           { add_to_expression(yytext()); return symbol(sym.SIN); }
{COS}           { add_to_expression(yytext()); return symbol(sym.COS); }
{TAN}           { add_to_expression(yytext()); return symbol(sym.TAN); }
{VARIABLE}      { add_to_expression(yytext()); return symbol(sym.VARIABLE, yytext().charAt(0)); }
{MODULO}        { add_to_expression(yytext()); return symbol(sym.MODULO); }
"+"             { add_to_expression(yytext()); return symbol(sym.PLUS); }
"-"             { add_to_expression(yytext()); return symbol(sym.MINUS); }
"*"             { add_to_expression(yytext()); return symbol(sym.TIMES); }
"/"             { add_to_expression(yytext()); return symbol(sym.DIV); }
"^"             { add_to_expression(yytext()); return symbol(sym.POWER); }
"="             { add_to_expression(yytext()); return symbol(sym.EQUALS); }
"("             { add_to_expression(yytext()); return symbol(sym.LPAREN); }
")"             { add_to_expression(yytext()); return symbol(sym.RPAREN); }
{NEWLINE}       { return symbol(sym.NEWLINE); }
{WHITESPACE}    { add_to_expression(" "); /* Keep spacing in expression */ }
.               { System.err.println("Invalid character at line " + yyline + ", column " + yycolumn + ": " + yytext()); }