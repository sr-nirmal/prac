%{
#include<stdio.h>
int flag=0;
%}
%token NUMBER ID
%left '+''-'
%left '*''/'

%%
Arithemtic:E {printf("Result %d",$$);}
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|'('E')' {$$=$2;}
|NUMBER	{$$=$1;}
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
