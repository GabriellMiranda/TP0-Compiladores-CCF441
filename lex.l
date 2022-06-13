%{
    #include <stdio.h>
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/
%}
/* This tells flex to read only one input file */
%option noyywrap


DIGITO [0-9]+
POSITIVO ([+]{DIGITO})|{DIGITO}
NEGATIVO [-]{DIGITO}
DECIMAL ({POSITIVO}|{NEGATIVO})[.]{DIGITO}
PALAVRA [a-zA-Z]+
TELEFONE {DIGITO}{4}[-]{DIGITO}{4}
PLACA  [A-Z]{3}[-]{DIGITO}{4}
NOME {PALAVRA}[ ]{PALAVRA}[ ]{PALAVRA}|{PALAVRA}[ ]{PALAVRA}[ ]{PALAVRA}[ ]{PALAVRA}
delim [ \t\n]
ws {delim}+


%%

{POSITIVO}     {printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);}
{NEGATIVO}     {printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext);}
{PALAVRA}      {printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext);}
{TELEFONE}     {printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext);}
{DECIMAL}      {printf("Foi encontrado um numero decimal. LEXEMA: %s\n", yytext);}
{NOME}         {printf("Foi encontrado um nome. LEXEMA: %s\n", yytext);}
{PLACA}        {printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext);}
{ws}           {/*nenhuma acao e nenhuma retortno*/}


%%
/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/
int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}