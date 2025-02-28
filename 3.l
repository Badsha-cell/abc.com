%{
    #include "3.tab.h"
    #include <stdio.h>
%}

%%

[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[+\-*/()] { return yytext[0]; }
\n        { return '\n'; }
[ \t]     { /* Ignore whitespace */ }
.         { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() { return 1; }
