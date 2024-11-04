{
module Parser where

import Token
import qualified Lex as L
}

%name calc
%tokentype { Token }
%error { parseError }
%token 
  '+' {ADD}
  '-' {SUB}
  '*' {MUL}
  '/' {DIV}
  '(' {LPAR}
  ')' {RPAR}
  '/=' {DIF} 
  '&&' {E} 
  '||' {OU} 
  '!' {NAO}
  '==' {IGUAL} 
  '>=' {MAIORE} 
  '>' {MAIOR} 
  '<=' {MENORE} 
  '<' {MENOR}
  
  Num {NUM $$}


%%

Inicio : Logica {Left $1} 
       | Expr {Right $1}

Logica : Logica '&&' LTermo {$1 && $3}
       | Logica '||' LTermo {$1 || $3}
       | LTermo {$1}

LTermo : '!' LFator {not $2}
       | LFator   {$1}

LFator : '(' Logica ')' {$2}
       | RelExpr  {$1}

RelExpr : Expr '==' Expr {$1 == $3}
	| Expr '>=' Expr 	{$1 >= $3}
	| Expr '>' Expr	{$1 > $3}
	| Expr '<' Expr 	{$1 < $3}
	| Expr '<=' Expr	{$1 <= $3}
	| Expr '/=' Expr 	{$1 /= $3}


Expr  : Expr '+' Term       {$1 + $3}
      | Expr '-' Term       {$1 - $3}
      | Term                {$1}

Term  : Term  '*' Factor    {$1 * $3}
      | Term '/' Factor     {$1 / $3}
      | Factor              {$1}

Factor : Num                {$1}
       | '(' Expr ')'       {$2}      


{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          print (calc (L.alexScanTokens s))
}