%{
#include"y.tab.h"
%}
%%
[0-9]+ {
yylval.symbol=(char)(yytext[0]);
return NUMBER;}
[a-zA-Z][a-zA-Z0-9]* {
yylval.symbol=(char)(yytext[0]);
return LETTER;}
\n {return 0;}
. {return yytext[0];}
%%

