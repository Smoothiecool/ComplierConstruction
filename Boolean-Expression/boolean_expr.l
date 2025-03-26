%{
#include "y.tab.h"  // Include the YACC header for token definitions
%}

%%

true        { return TRUE; }
false       { return FALSE; }
"&&"        { return AND; }
"||"        { return OR; }
"!"         { return NOT; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[ \t\n]     { /* Skip whitespace */ }
.           { /* Ignore any invalid character */ }

%%

int yywrap() {
    return 1;  // Indicates end of input
}
