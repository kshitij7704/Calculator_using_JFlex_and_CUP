import java_cup.runtime.*;

%%

%class CalculatorLexer
%cup
%unicode
%line
%column
%public

%{
    private void add_to_expression(String text) {
        fullExpression.append(text).append(" ");
    }
    
    private StringBuilder fullExpression = new StringBuilder();
%}

NUMBER      = [0-9]+(\.[0-9]+)?
PI          = "PI"
EXIT        = "EXIT"
CLEAR       = "CLEAR"
HISTORY     = "HISTORY"
SQRT        = "sqrt"
MOD         = "mod"
SIN         = "sin"
COS         = "cos"
TAN         = "tan"
VARIABLE    = [a-zA-Z]
MODULO      = "%"
OPERATORS   = [+\-*/^=()]
NEWLINE     = \n
WHITESPACE  = [\t ]+

%%

{NUMBER}        { add_to_expression(yytext()); return new Symbol(sym.NUMBER, Double.parseDouble(yytext())); }
{PI}            { add_to_expression(yytext()); return new Symbol(sym.PI); }
{EXIT}          { return new Symbol(sym.EXIT); }
{CLEAR}         { return new Symbol(sym.CLEAR); }
{HISTORY}       { return new Symbol(sym.HISTORY); }
{SQRT}          { add_to_expression(yytext()); return new Symbol(sym.SQRT); }
{MOD}           { add_to_expression(yytext()); return new Symbol(sym.MOD); }
{SIN}           { add_to_expression(yytext()); return new Symbol(sym.SIN); }
{COS}           { add_to_expression(yytext()); return new Symbol(sym.COS); }
{TAN}           { add_to_expression(yytext()); return new Symbol(sym.TAN); }
{VARIABLE}      { add_to_expression(yytext()); return new Symbol(sym.VARIABLE, yytext().charAt(0)); }
{MODULO}        { add_to_expression(yytext()); return new Symbol(sym.MOD); }
{OPERATORS}     { add_to_expression(yytext()); return new Symbol(yytext().charAt(0)); }
{NEWLINE}       { return new Symbol(sym.NEWLINE); }
{WHITESPACE}    { /* Ignore */ }
.               { System.err.println("Invalid character: " + yytext()); }