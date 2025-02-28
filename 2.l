%{
    #include <stdio.h>
%}

DIGIT      [0-9]
LETTER     [a-zA-Z_]
ID         {LETTER}({LETTER}|{DIGIT})*

%%

"int"|"float"|"char"|"double"|"void"|"return"   { printf("<KEYWORD, %s>\n", yytext); }
"if"|"else"|"for"|"while"|"do"|"switch"|"case"  { printf("<KEYWORD, %s>\n", yytext); }
"break"|"continue"                               { printf("<KEYWORD, %s>\n", yytext); }

{ID}    { printf("<IDENTIFIER, %s>\n", yytext); }
{DIGIT}+  { printf("<NUMBER, %s>\n", yytext); }

"="|"+"|"-"|"*"|"/"|"%" { printf("<OPERATOR, %s>\n", yytext); }

";"|","|"("|")"|"{"|"}"  { printf("<SYMBOL, %s>\n", yytext); }

[ \t\n]  { /* Ignore whitespace */ }
.        { printf("<UNKNOWN, %s>\n", yytext); }

%%

int yywrap() { return 1; }

int main() {
    printf("Lexical Analysis Output:\n");
    yylex();
    return 0;
}
