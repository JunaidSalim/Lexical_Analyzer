%{
#include <stdio.h>
int line_number = 1;
%}

%option noyywrap

%%
[ \t]              ; // ignore whitespace
\n                 { line_number++; } // increment line number on newline

int|float|double|char|string|void|long|wchar_t|short|signed|unsigned  { printf("DATATYPE\t%s\t%d\n", yytext, line_number); }
if|else|for|while|do|switch|case|default|break|continue|public|private|protected { printf("KEYWORD\t%s\t%d\n", yytext, line_number); }
return             { printf("KEYWORD\t%s\t%d\n", yytext, line_number); }
INT_MAX|INT_MIN|CHAR_MIN|CHAR_MAX|SCHAR_MIN|SCHAR_MAX|ULONG_MAX|LONG_MIN|LONG_MAX|ULLONG_MAX {printf("MACROS\t%s\t%d\n", yytext, line_number);}
cout|cin {printf("LIBRARY FUNCTIONS\t%s\t%d\n", yytext, line_number);}
struct|array|class|enum|vector {printf("DERIVED DATATYPES\t%s\t%d\n", yytext, line_number);}

[a-zA-Z_][a-zA-Z0-9_]*     { printf("IDENTIFIER\t%s\t%d\n", yytext, line_number); }
[#][a-zA-Z_][a-zA-Z0-9_]*  { printf("PREPROCESSOR DIRECTIVE\t%s\t%d\n", yytext, line_number); }

[0-9]+                   { printf("INTEGER\t%s\t%d\n", yytext, line_number); }
[0-9]+"."[0-9]+          { printf("FLOAT\t%s\t%d\n", yytext, line_number); }
[0-9]+"."[0-9]+"e"[-+]?[0-9]+   { printf("FLOAT\t%s\t%d\n", yytext, line_number); }

[+\-*/%]=               { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
[+\-*/%=<>!]=           { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
&&|\|\|                 { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
[&|^~<>]=               { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
[?:!]=                  { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
">>"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"<<"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"="                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"::"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
[{}()[\],;]             { printf("PUNCTUATION\t%s\t%d\n", yytext, line_number); }
"<"                   { printf("PUNCTUATION\t%s\t%d\n", yytext, line_number); }
">"                   { printf("PUNCTUATION\t%s\t%d\n", yytext, line_number); }
"+"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"-"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"/"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"*"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"%"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
":"                   { printf("OPERATOR\t%s\t%d\n", yytext, line_number); }
"."                   { printf("PUNCTUATION\t%s\t%d\n", yytext, line_number); }


\"([^\\\n]|(\\.))*?\"   { printf("STRING\t%s\t%d\n", yytext, line_number); }

\/\/.*                  ;

\/\*([^*]|\*+[^*/])*\*+\/ { /* ignore comments */ }

.                     { printf("UNKNOWN\t%s\t%d\n", yytext, line_number); }

%%

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE* input = fopen(argv[1], "r");
    if (!input) {
        perror("Error opening file");
        return 1;
    }

    yyin = input;
    yylex();
    fclose(input);
    return 0;
}