{-# OPTIONS_GHC -w #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoStrictData #-}
#if __GLASGOW_HASKELL__ >= 710
{-# LANGUAGE PartialTypeSignatures #-}
#endif
module Parser where

import Token
import qualified Lex as L

data Ex = ADD Ex Ex | SUB Ex Ex | MUL Ex Ex | DIV Ex Ex | Double deriving Show
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 2.0.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
        = HappyTerminal (Token)
        | HappyErrorToken Prelude.Int
        | HappyAbsSyn4 t4
        | HappyAbsSyn5 t5
        | HappyAbsSyn6 t6
        | HappyAbsSyn7 t7
        | HappyAbsSyn8 t8
        | HappyAbsSyn9 t9
        | HappyAbsSyn10 t10
        | HappyAbsSyn11 t11

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x80\x10\x04\x00\x08\x41\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\xe2\x03\x00\x06\x00\x00\x00\x00\x00\x00\x08\x41\x00\x80\x00\x04\x00\x00\x00\x00\x00\x00\x00\x80\x21\x3e\x00\x80\x00\x04\x00\x08\x40\x00\x80\x00\x04\x00\x08\x40\x00\x80\x00\x04\x00\x08\x40\x00\x80\x00\x04\x00\x08\x40\x00\x00\x00\x00\x00\xd0\x00\x00\x18\xe3\x03\x00\x08\x40\x00\x80\x00\x04\x00\x08\x41\x00\x80\x10\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\x00\x00\x80\x01\x00\x00\x18\x00\x00\x80\x01\x00\x00\x18\x00\x00\x80\x01\x00\x00\x60\x00\x00\x00\x06\x00\x00\x18\x01\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Inicio","Logica","LTermo","LFator","RelExpr","Expr","Term","Factor","'+'","'-'","'*'","'/'","'('","')'","'/='","'&&'","'||'","'!'","'=='","'>='","'>'","'<='","'<'","Num","%eof"]
        bit_start = st               Prelude.* 28
        bit_end   = (st Prelude.+ 1) Prelude.* 28
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..27]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x1b\x00\x00\x00\x1b\x00\x00\x00\x5b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x62\x00\x00\x00\x00\x00\x00\x00\x1b\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\xf0\xff\xff\xff\x10\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x01\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\x1b\x00\x00\x00\x1b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x22\x00\x00\x00\x22\x00\x00\x00\x22\x00\x00\x00\x22\x00\x00\x00\x22\x00\x00\x00\x22\x00\x00\x00\x64\x00\x00\x00\x64\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x2c\x00\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3a\x00\x00\x00\x4b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63\x00\x00\x00\x65\x00\x00\x00\xff\xff\xff\xff\x13\x00\x00\x00\x4e\x00\x00\x00\x51\x00\x00\x00\x54\x00\x00\x00\x57\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x0f\x00\x00\x00\x40\x00\x00\x00\x46\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\xfe\xff\xff\xff\xfa\xff\xff\xff\xf8\xff\xff\xff\xf6\xff\xff\xff\x00\x00\x00\x00\xed\xff\xff\xff\xea\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe9\xff\xff\xff\x00\x00\x00\x00\xfd\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf9\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\xff\xff\xfc\xff\xff\xff\xeb\xff\xff\xff\x00\x00\x00\x00\xec\xff\xff\xff\xe8\xff\xff\xff\xf7\xff\xff\xff\xf2\xff\xff\xff\xf1\xff\xff\xff\xf3\xff\xff\xff\xf4\xff\xff\xff\xf5\xff\xff\xff\xf0\xff\xff\xff\xee\xff\xff\xff\xef\xff\xff\xff\x00\x00\x00\x00"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\xff\xff\x11\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x05\x00\x00\x00\xff\xff\xff\xff\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x07\x00\x00\x00\x10\x00\x00\x00\x10\x00\x00\x00\x07\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x05\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x0a\x00\x00\x00\x06\x00\x00\x00\x06\x00\x00\x00\xff\xff\xff\xff\x08\x00\x00\x00\x09\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\x08\x00\x00\x00\x09\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x00\x00\xff\xff\xff\xff\x0f\x00\x00\x00\x10\x00\x00\x00\x29\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x23\x00\x00\x00\x11\x00\x00\x00\x0a\x00\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x21\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x28\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x0a\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x0b\x00\x00\x00\x23\x00\x00\x00\x24\x00\x00\x00\x00\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x0d\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x17\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x18\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x1e\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x1d\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x16\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x27\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x26\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x25\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x24\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x2c\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x00\x00\x2b\x00\x00\x00\x08\x00\x00\x00\x2a\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 23) [
        (1 , happyReduce_1),
        (2 , happyReduce_2),
        (3 , happyReduce_3),
        (4 , happyReduce_4),
        (5 , happyReduce_5),
        (6 , happyReduce_6),
        (7 , happyReduce_7),
        (8 , happyReduce_8),
        (9 , happyReduce_9),
        (10 , happyReduce_10),
        (11 , happyReduce_11),
        (12 , happyReduce_12),
        (13 , happyReduce_13),
        (14 , happyReduce_14),
        (15 , happyReduce_15),
        (16 , happyReduce_16),
        (17 , happyReduce_17),
        (18 , happyReduce_18),
        (19 , happyReduce_19),
        (20 , happyReduce_20),
        (21 , happyReduce_21),
        (22 , happyReduce_22),
        (23 , happyReduce_23)
        ]

happy_n_terms = 18 :: Prelude.Int
happy_n_nonterms = 8 :: Prelude.Int

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
         =  HappyAbsSyn4
                 (Left happy_var_1
        )
happyReduction_1 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_1  0# happyReduction_2
happyReduction_2 (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn4
                 (Right happy_var_1
        )
happyReduction_2 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_3  1# happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
        _
        (HappyAbsSyn5  happy_var_1)
         =  HappyAbsSyn5
                 (happy_var_1 && happy_var_3
        )
happyReduction_3 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_3  1# happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_3)
        _
        (HappyAbsSyn5  happy_var_1)
         =  HappyAbsSyn5
                 (happy_var_1 || happy_var_3
        )
happyReduction_4 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happySpecReduce_1  1# happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_1)
         =  HappyAbsSyn5
                 (happy_var_1
        )
happyReduction_5 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_2  2# happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
        _
         =  HappyAbsSyn6
                 (not happy_var_2
        )
happyReduction_6 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_1  2# happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
         =  HappyAbsSyn6
                 (happy_var_1
        )
happyReduction_7 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_3  3# happyReduction_8
happyReduction_8 _
        (HappyAbsSyn5  happy_var_2)
        _
         =  HappyAbsSyn7
                 (happy_var_2
        )
happyReduction_8 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_1  3# happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
         =  HappyAbsSyn7
                 (happy_var_1
        )
happyReduction_9 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_3  4# happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 == happy_var_3
        )
happyReduction_10 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_3  4# happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 >= happy_var_3
        )
happyReduction_11 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_3  4# happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 > happy_var_3
        )
happyReduction_12 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_3  4# happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 < happy_var_3
        )
happyReduction_13 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_3  4# happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 <= happy_var_3
        )
happyReduction_14 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_3  4# happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn8
                 (happy_var_1 /= happy_var_3
        )
happyReduction_15 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_3  5# happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn9
                 (happy_var_1 + happy_var_3
        )
happyReduction_16 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_3  5# happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn9
                 (happy_var_1 - happy_var_3
        )
happyReduction_17 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happySpecReduce_1  5# happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_1)
         =  HappyAbsSyn9
                 (happy_var_1
        )
happyReduction_18 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happySpecReduce_3  6# happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
        _
        (HappyAbsSyn10  happy_var_1)
         =  HappyAbsSyn10
                 (happy_var_1 * happy_var_3
        )
happyReduction_19 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_3  6# happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
        _
        (HappyAbsSyn10  happy_var_1)
         =  HappyAbsSyn10
                 (happy_var_1 / happy_var_3
        )
happyReduction_20 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_1  6# happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_1)
         =  HappyAbsSyn10
                 (happy_var_1
        )
happyReduction_21 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happySpecReduce_1  7# happyReduction_22
happyReduction_22 (HappyTerminal (NUM happy_var_1))
         =  HappyAbsSyn11
                 (happy_var_1
        )
happyReduction_22 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happySpecReduce_3  7# happyReduction_23
happyReduction_23 _
        (HappyAbsSyn9  happy_var_2)
        _
         =  HappyAbsSyn11
                 (happy_var_2
        )
happyReduction_23 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
        happyDoAction 17# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
        let cont i = happyDoAction i tk action sts stk tks in
        case tk of {
        ADD -> cont 1#;
        SUB -> cont 2#;
        MUL -> cont 3#;
        DIV -> cont 4#;
        LPAR -> cont 5#;
        RPAR -> cont 6#;
        DIF -> cont 7#;
        E -> cont 8#;
        OU -> cont 9#;
        NAO -> cont 10#;
        IGUAL -> cont 11#;
        MAIORE -> cont 12#;
        MAIOR -> cont 13#;
        MENORE -> cont 14#;
        MENOR -> cont 15#;
        NUM happy_dollar_dollar -> cont 16#;
        _ -> happyError' ((tk:tks), [])
        }

happyError_ explist 17# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          print (calc (L.alexScanTokens s))
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $

#if !defined(__GLASGOW_HASKELL__)
#  error This code isn't being built with GHC.
#endif

-- Get WORDS_BIGENDIAN (if defined)
#include "MachDeps.h"

-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#  define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#  define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#  define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#  define LT(n,m) (n Happy_GHC_Exts.<# m)
#  define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#  define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
#define PLUS(n,m) (n Happy_GHC_Exts.+# m)
#define MINUS(n,m) (n Happy_GHC_Exts.-# m)
#define TIMES(n,m) (n Happy_GHC_Exts.*# m)
#define NEGATE(n) (Happy_GHC_Exts.negateInt# (n))

type Happy_Int = Happy_GHC_Exts.Int#
data Happy_IntList = HappyCons Happy_Int Happy_IntList

#define ERROR_TOK 0#

#if defined(HAPPY_COERCE)
#  define GET_ERROR_TOKEN(x)  (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (happyInTok (x))
#else
#  define GET_ERROR_TOKEN(x)  (case x of { HappyErrorToken (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (HappyErrorToken (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (HappyTerminal (x))
#endif

#if defined(HAPPY_DEBUG)
#  define DEBUG_TRACE(s)    (happyTrace (s)) $
happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO $ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    return expr
#else
#  define DEBUG_TRACE(s)    {- nothing -}
#endif

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept ERROR_TOK tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

happyDoAction i tk st =
  DEBUG_TRACE("state: " ++ show (Happy_GHC_Exts.I# st) ++
              ",\ttoken: " ++ show (Happy_GHC_Exts.I# i) ++
              ",\taction: ")
  case happyDecodeAction (happyNextAction i st) of
    HappyFail             -> DEBUG_TRACE("failing.\n")
                             happyFail (happyExpListPerState (Happy_GHC_Exts.I# st)) i tk st
    HappyAccept           -> DEBUG_TRACE("accept.\n")
                             happyAccept i tk st
    HappyReduce rule      -> DEBUG_TRACE("reduce (rule " ++ show (Happy_GHC_Exts.I# rule) ++ ")")
                             (happyReduceArr Happy_Data_Array.! (Happy_GHC_Exts.I# rule)) i tk st
    HappyShift  new_state -> DEBUG_TRACE("shift, enter state " ++ show (Happy_GHC_Exts.I# new_state) ++ "\n")
                             happyShift new_state i tk st

{-# INLINE happyNextAction #-}
happyNextAction i st = case happyIndexActionTable i st of
  Just (Happy_GHC_Exts.I# act) -> act
  Nothing                      -> happyIndexOffAddr happyDefActions st

{-# INLINE happyIndexActionTable #-}
happyIndexActionTable i st
  | GTE(off, 0#), EQ(happyIndexOffAddr happyCheck off, i)
  = Prelude.Just (Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off))
  | otherwise
  = Prelude.Nothing
  where
    off = PLUS(happyIndexOffAddr happyActOffsets st, i)

data HappyAction
  = HappyFail
  | HappyAccept
  | HappyReduce Happy_Int -- rule number
  | HappyShift Happy_Int  -- new state

{-# INLINE happyDecodeAction #-}
happyDecodeAction :: Happy_Int -> HappyAction
happyDecodeAction  0#                        = HappyFail
happyDecodeAction -1#                        = HappyAccept
happyDecodeAction action | LT(action, 0#)    = HappyReduce NEGATE(PLUS(action, 1#))
                         | otherwise         = HappyShift MINUS(action, 1#)

{-# INLINE happyIndexGotoTable #-}
happyIndexGotoTable nt st = happyIndexOffAddr happyTable off
  where
    off = PLUS(happyIndexOffAddr happyGotoOffsets st, nt)

{-# INLINE happyIndexOffAddr #-}
happyIndexOffAddr :: HappyAddr -> Happy_Int -> Happy_Int
happyIndexOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  Happy_GHC_Exts.int32ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  -- The CI of `alex` tests this code path
  (Happy_GHC_Exts.word32ToInt32# (Happy_GHC_Exts.wordToWord32# (Happy_GHC_Exts.byteSwap32# (Happy_GHC_Exts.word32ToWord# (Happy_GHC_Exts.int32ToWord32#
#endif
  (Happy_GHC_Exts.indexInt32OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif

{-# INLINE happyLt #-}
happyLt x y = LT(x,y)

readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (happyIndexOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 5#))) (bit `Prelude.mod` 32)
  where unbox_int (Happy_GHC_Exts.I# x) = x

data HappyAddr = HappyA# Happy_GHC_Exts.Addr#

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state ERROR_TOK tk st sts stk@(x `HappyStk` _) =
     let i = GET_ERROR_TOKEN(x) in
-- trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons st sts) stk

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons st sts) (MK_TOKEN(tk) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_0 nt fn j tk st sts stk
     = happyGoto nt j tk st (HappyCons st sts) (fn `HappyStk` stk)

happySpecReduce_1 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(HappyCons st _) (v1 `HappyStk` stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_2 nt fn j tk _
  (HappyCons _ sts@(HappyCons st _))
  (v1 `HappyStk` v2 `HappyStk` stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_3 nt fn j tk _
  (HappyCons _ (HappyCons _ sts@(HappyCons st _)))
  (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop MINUS(k,(1# :: Happy_Int)) sts of
         sts1@(HappyCons st1 _) ->
                let r = fn stk in -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk)
                     (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk
              off = happyAdjustOffset (happyIndexOffAddr happyGotoOffsets st1)
              off_i = PLUS(off, nt)
              new_state = happyIndexOffAddr happyTable off_i
          in
            happyThen1 (fn stk tk)
                       (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l               = l
happyDrop n  (HappyCons _ t) = happyDrop MINUS(n,(1# :: Happy_Int)) t

happyDropStk 0# l                 = l
happyDropStk n  (x `HappyStk` xs) = happyDropStk MINUS(n,(1#::Happy_Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto nt j tk st =
   DEBUG_TRACE(", goto state " ++ show (Happy_GHC_Exts.I# new_state) ++ "\n")
   happyDoAction j tk new_state
  where new_state = happyIndexGotoTable nt st

-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist ERROR_TOK tk old_st _ stk@(x `HappyStk` _) =
     let i = GET_ERROR_TOKEN(x) in
--      trace "failing" $
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st (HappyCons action sts)
                               (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction ERROR_TOK tk action sts (saved_tok`HappyStk`stk)
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk action sts stk =
-- trace "entering error recovery" $
        happyDoAction ERROR_TOK tk action sts (MK_ERROR_TOKEN(i) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

happyTcHack :: Happy_Int -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
