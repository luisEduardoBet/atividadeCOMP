{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]          -- digits
@num = $digit+(\.$digit+)?

tokens :-

<0> $white+ ;
<0> @num {\s -> NUM (read s)}
<0> "+" {\s -> ADD}  
<0> "-" {\s -> SUB}  
<0> "*" {\s -> MUL}
<0> "/="{\s -> DIF}  
<0> "/" {\s -> DIV}  
<0> "(" {\s -> LPAR}  
<0> ")" {\s -> RPAR}
<0> "&&" {\s -> E} 
<0> "||" {\s-> OU}
<0> "!" {\s -> NAO}
<0> "==" {\s -> IGUAL} 
<0> ">=" {\s -> MAIORE} 
<0> ">" {\s -> MAIOR}
<0> "<="{\s -> MENORE} 
<0> "<" {\s -> MENOR}    

{
-- As acoes tem tipo :: String -> Token

testLex = do s <- getLine
             print (alexScanTokens s)
}
