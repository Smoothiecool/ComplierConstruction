%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();  // The lexer function
extern int yyparse();  // The parser function
void yyerror(const char *s) { fprintf(stderr, "%s\n", s); }  // Error function

%}

%union {
    int boolean;  // For storing boolean values (0 for false, 1 for true)
}

%token <boolean> TRUE FALSE
%token AND OR NOT LPAREN RPAREN
%left AND OR
%right NOT

%%

expr:
      TRUE              { $$ = 1; }  // TRUE evaluates to 1 (true)
    | FALSE             { $$ = 0; }  // FALSE evaluates to 0 (false)
    | expr AND expr     { $$ = $1 && $3; }  // Logical AND
    | expr OR expr      { $$ = $1 || $3; }  // Logical OR
    | NOT expr          { $$ = !$2; }  // Logical NOT
    | LPAREN expr RPAREN { $$ = $2; }  // Parentheses for grouping
    ;

%%

int main() {
    printf("Enter a boolean expression: ");
    yyparse();  // Start parsing
    return 0;
}

