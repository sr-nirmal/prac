%{
#include"y.tab.h"
#include<stdio.h>
#include<string.h>
char addtotable(char,char,char);
int index1=0;
char temp = 'A';
struct expr{
char operand1;
char operand2;
char operator;
char result;
};
%}
%union{
char symbol;
}
%left '+' '-'
%left '/' '*'
%token <symbol> LETTER NUMBER
%type <symbol> exp

%%
statement: LETTER '=' exp ';' {addtotable((char)$1,(char)$3,'=');};
exp: exp '+' exp {$$ = addtotable((char)$1,(char)$3,'+');}
|exp '-' exp {$$ = addtotable((char)$1,(char)$3,'-');}
|exp '/' exp {$$ = addtotable((char)$1,(char)$3,'/');}
|exp '*' exp {$$ = addtotable((char)$1,(char)$3,'*');}
|'(' exp ')' {$$= (char)$2;}
|NUMBER {$$ = (char)$1;}
|LETTER {(char)$1;};
%%
struct expr arr[20];
void yyerror(char *s){

}
char addtotable(char a, char b, char o){
temp++;
arr[index1].operand1 =a;
arr[index1].operand2 = b;
arr[index1].operator = o;
arr[index1].result=temp;
index1++;
return temp;
}
void cout(char t){
if(t>= 65 && t<=91){
printf("t%c\t",t-17);
} else{ printf("%c\t",t);
}
}
void threeAdd(){
int i=0;
char temp='A';
while(i<index1){
if(arr[i].operator==61){
cout(arr[i].operand1);

cout(arr[i].operator);
cout(arr[i].operand2);
} else{
cout(arr[i].result); printf("=\t");
cout(arr[i].operand1);
cout(arr[i].operator);
cout(arr[i].operand2);
temp++;
}
i++;
printf("\n");
}
}
int yywrap(){
return 1;
}
int main(){
printf("Enter the expression: ");
yyparse();
threeAdd();
}
