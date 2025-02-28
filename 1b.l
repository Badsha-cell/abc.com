%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Valid Identifier: %s\n", yytext); }
[^a-zA-Z0-9_\n]         { printf("Invalid Input: %s\n", yytext); }
\n                      { /* Ignore new lines */ }
%%

int main() {
    printf("Enter input: ");
    yylex();  
    return 0;
}

int yywrap() {
    return 1;
}

