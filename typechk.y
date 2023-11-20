%{
#include <stdio.h>
#include <stdlib.h>

%}

%token NUM
%left '+' '-'
%left '*' '/'

%type <ival>  expression

%union
{
int ival;
}

%%

expression:
    NUM { $$ = NUM; }
    | expression '+' expression {
        if ($1 == NUM &&  $3 == NUM) {
            $$ = NUM;  
        printf("Valid\n");
    exit(0);
    }  
    }
    | expression '-' expression {
        if ($1 == NUM || $3 == NUM) {
            $$ = NUM;    
    printf("Valid\n"); exit(0);}
    }
    ;

%%

int main() {
    yyparse();
    return 0;
}

yyerror()
{
 printf("Type Error\n");
}
