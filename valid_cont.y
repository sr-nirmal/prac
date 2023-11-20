%{
#include<stdio.h>
int flag=1;
%}
%token IF ELSE REL_OP NUMBER VAR PMOP L_BRACE R_BRACE L_BRACK R_BRACK
%%
S:IF C B Y
C:L_BRACK X R_BRACK 
B:L_BRACE R_BRACE
Y:ELSE S | ELSE B|;
X:op|op REL_OP op;
op:VAR|NUMBER;


%%
int yyerror()
{
	printf("Syntax error");
	flag=0;
}
int main()
{
	yyparse();
	if(flag)
	printf("Successfull");
}
