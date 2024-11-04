module Token where

data Token
  = NUM Double
  | ADD
  | SUB
  | MUL
  | DIV
  | LPAR
  | RPAR
  | DIF
  | E
  | OU
  | NAO
  | IGUAL
  | MAIOR
  | MAIORE
  | MENOR
  | MENORE
  deriving (Eq, Show)
  
