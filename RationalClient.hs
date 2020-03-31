{-# LANGUAGE ViewPatterns #-}

module RationalClient where

import Prelude hiding (Rational)
import Rational

denom :: Rational -> Int
denom (ratView -> Rat a b) = a

-- a = Rational 6 4
b = mkRational 6 4
c = denom b
