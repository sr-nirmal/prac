%{
#include<stdio.h>
int flag=0;
%}
%token NUMBER ID
%left '+''-'
%left '*''/'

%%
E:E'+'E
|E'-'E
|E'*'E
|E'/'E
|'('E')'
|NUMBER
|ID;
%%

void main()
{
	yyparse();
	if(!flag)
	printf("VALID\n");
}
int yyerror()
{
	printf("INVALID\n");
	flag=1;
	
}
