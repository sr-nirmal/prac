%{
#include "y.tab.h"
%}
%%
"if" {return IF;}
"else" {return ELSE;}
"check" {return 0;}
"=="|">"|"<"|">="|"<=" {return REL_OP;}
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9]* {return VAR;}
"++"|"--" {return PMOP;}
"{" {return L_BRACE;}
"}" {return R_BRACE;}
"(" {return L_BRACK;}
")" {return R_BRACK;}

%%

