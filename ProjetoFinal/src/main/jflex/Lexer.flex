package com.mycompany.projetofinal;

import java.io.IOException; // Import necessário caso ocorram exceções de I/O

%%

// ---------------------- CONFIGURAÇÕES DO LEXER ----------------------

// Nome da classe gerada pelo JFlex
%class Lexer

// Tipo de retorno do método yylex()
%type java.lang.Object

// Habilita suporte a caracteres Unicode
%unicode

// Classe pública e final
%public
%final

// Habilita contagem de linhas e colunas
%line
%column

%%

// ---------------------- REGRAS LÉXICAS ----------------------

// Palavras reservadas do Java
"if"            { return "IF"; }
"else"          { return "ELSE"; }
"int"           { return "INT"; }
"public"        { return "PUBLIC"; }
"class"         { return "CLASS"; }
"static"        { return "STATIC"; }
"void"          { return "VOID"; }
"return"        { return "RETURN"; }
"import"        { return "IMPORT"; }
"package"       { return "PACKAGE"; }
"true"          { return "TRUE"; }
"false"         { return "FALSE"; }
"while"         { return "WHILE"; }
"for"           { return "FOR"; }
"String"        { return "STRING_TYPE"; } // Tipo de dado String

// Operadores aritméticos
"+"             { return "PLUS"; }
"-"             { return "MINUS"; }
"*"             { return "MULT"; }
"/"             { return "DIV"; }

// Operadores lógicos
"&&"            { return "AND"; }
"||"            { return "OR"; }
"!"             { return "NOT"; }

// Operadores relacionais
"=="            { return "EQ"; }
"!="            { return "NEQ"; }
"<"             { return "LT"; }
">"             { return "GT"; }
"="             { return "ASSIGN"; }

// Delimitadores e pontuação
"{"             { return "LBRACE"; }
"}"             { return "RBRACE"; }
"("             { return "LPAREN"; }
")"             { return "RPAREN"; }
";"             { return "SEMICOLON"; }
"."             { return "DOT"; }
","             { return "COMMA"; }

// Strings literais (texto entre aspas)
\"[^\"]*\"      { return "STRING_LITERAL(" + yytext() + ")"; }

// Comentários de linha única
"//"[^\n]* { /* ignora o comentário */ }

// Identificadores (variáveis, nomes de classes, etc.)
[a-zA-Z_][a-zA-Z0-9_]* { return "ID(" + yytext() + ")"; }

// Números inteiros
[0-9]+          { return "NUMBER(" + yytext() + ")"; }

// Espaços e quebras de linha
[ \t\r\n]+      { /* ignora */ }

// Qualquer outro caractere inesperado
.               { return "INVALID(" + yytext() + ")"; }
