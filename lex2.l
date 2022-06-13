%{ 
    #include <stdio.h>
/*codigo colocado aqui aparece no arquivo gerado pelo flex*/ 

%} 

/* This tells flex to read only one input file */ 
%option noyywrap 

/* definicoes regulares */ 

DIGITO [0-9]+
POSITIVO ([+]{DIGITO})|{DIGITO}
NEGATIVO [-]{DIGITO}
SOMA ({POSITIVO}|{NEGATIVO})[+]{DIGITO}
SUBTRACAO ({POSITIVO}|{NEGATIVO})[-]{DIGITO}
NOME [A-Za-z]+
INSTAGRAM [@]{NOME}
TEMPORIZADOR {DIGITO}{2}[:]{DIGITO}{2}
ARQUIVOC {NOME}[.][c]
delim		[ \t\n] 
ws		{delim}+ 

%% 

{ARQUIVOC}     {printf("Foi encontrado um arquivo.c. LEXEMA: %s\n", yytext);}
{TEMPORIZADOR} {printf("Foi encontrado um temporizador. LEXEMA: %s\n", yytext);}
{INSTAGRAM}    {printf("Foi encontrado um @ de instagram. LEXEMA: %s\n", yytext);}
{POSITIVO}     {printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);}
{NEGATIVO}     {printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext);}
{SOMA}         {printf("Foi encontrado uma soma. LEXEMA: %s\n", yytext);}
{SUBTRACAO}    {printf("Foi encontrado um subtracao. LEXEMA: %s\n", yytext);}
{NOME}         {printf("Foi encontrado um nome. LEXEMA: %s\n", yytext);}
{ws}           {/*nenhuma acao e nenhuma retortno*/} 




%% 

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/ 

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex(); 
    return 0; 
}
