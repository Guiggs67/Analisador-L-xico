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
"if"        { return "IF"; }         // Token para palavra-chave if
"else"      { return "ELSE"; }       // Token para palavra-chave else
"int"       { return "INT"; }        // Token para tipo inteiro
"public"    { return "PUBLIC"; }     // Token para palavra-chave public
"class"     { return "CLASS"; }      // Token para palavra-chave class
"static"    { return "STATIC"; }     // Token para palavra-chave static
"void"      { return "VOID"; }       // Token para tipo void
"return"    { return "RETURN"; }     // Token para palavra-chave return

// Operadores aritméticos
"+"         { return "PLUS"; }       // Soma
"-"         { return "MINUS"; }      // Subtração
"*"         { return "MULT"; }       // Multiplicação
"/"         { return "DIV"; }        // Divisão

// Operadores relacionais
"=="        { return "EQ"; }         // Igualdade
"!="        { return "NEQ"; }        // Diferença
"<"         { return "LT"; }         // Menor que
">"         { return "GT"; }         // Maior que
"="         { return "ASSIGN"; }     // Atribuição

// Delimitadores e pontuação
"{"         { return "LBRACE"; }     // Chave aberta
"}"         { return "RBRACE"; }     // Chave fechada
"("         { return "LPAREN"; }     // Parêntese aberto
")"         { return "RPAREN"; }     // Parêntese fechado
";"         { return "SEMICOLON"; }  // Ponto e vírgula

// Identificadores (variáveis, nomes de funções, etc.)
[a-zA-Z_][a-zA-Z0-9_]* { return "ID(" + yytext() + ")"; } 
// Começa com letra ou underscore, seguido de letras, números ou underscore

// Números inteiros
[0-9]+      { return "NUMBER(" + yytext() + ")"; } 
// Uma ou mais ocorrências de dígitos

// Espaços e quebras de linha
[ \t\r\n]+  { /* ignora */ }  
// Ignora tabs, espaços e quebras de linha sem gerar token

// Qualquer outro caractere inesperado
.           { return "INVALID(" + yytext() + ")"; } 
// Captura qualquer caractere que não se encaixe nas regras anteriores
