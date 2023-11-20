%{
#include<stdio.h>
%}
%%
#.* {printf("%s is a preprocessor directive\n",yytext);}
void|float|int|for|while|struct|do|if|else|double|char|goto|break|continue|switch|main|return {printf("%s is a keyword\n",yytext);}
[a-z][a-zA-Z0-9]* {printf("%s is a identifier\n",yytext);}
\{ {printf("{ --> BLOCK BEGINS\n");}
\} {printf("} --> BLOCK ENDS\n");}
\".*\" {printf("%s is a string\n",yytext);}
= {printf("%s is a assignment op \n",yytext);}
\+|\-|\*|\/ {printf("%s is arithemtic op \n",yytext);}
[0-9]* {printf("%s is constant \n",yytext);}
\;|\,  {printf("%s is punctuation \n",yytext);}
%%
int main()
{
	FILE *file;
	file=fopen("sample.c","r");
	yyin=file;
	yylex();
	return 1;
}
