%{
#include "y.tab.h"
%}

%%

[0-9]+             { yylval.ival = atoi(yytext); return NUM; }
[-+*/=]            { return yytext[0]; }
[ \t\n]            ; // Ignore whitespace
.                 { return yytext[0]; }

%%
