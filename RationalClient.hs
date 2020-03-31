{-# LANGUAGE ViewPatterns #-}

module RationalClient where

import Prelude hiding (Rational)
import Rational

-- | |denom|, definida por pattern matching
denom :: Rational -> Int
denom (ratView -> Rat a b) = a

-- no compila 
-- a = Rational 6 4

r = mkRational 6 4


a = denom b -- => 3
