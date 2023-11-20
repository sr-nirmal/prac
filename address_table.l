%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct node
{
    char type[20];
    char var[20];
}NODE;
NODE table[20];
char ttype[20];
int i=0;
%}
%%
int|float|char|double {
    strcpy(ttype,yytext);
}

[a-zA-Z][0-9a-zA-Z_]* {
    strcpy(table[i].var,yytext);
    strcpy(table[i].type,ttype);
    i++;

}
"," 
";" {
    printf("ID\tDataType\tAddress\n");
    for(int j=0;j<i;j++)
    {	
        printf("%s\t%s\t%p\n",table[j].var,table[j].type,(void*)&table[j]);
    }
}
%%
int main()
{
    
    yylex();
    
   
    return 0;
}
