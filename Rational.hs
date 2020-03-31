{-# LANGUAGE ViewPatterns #-}

module Rational (Rational(),mkRational,RatView(Rat),ratView) where

import Prelude hiding (Rational)

-- | opaco
data Rational = Rational Int Int deriving Show

-- | constructor
mkRational a b = Rational (signum b * div a d) (div b' d)
  where d  = gcd a b'
        b' = abs b

-- | Vista (constructores contra los cuales hacer pattern maching)
data RatView = Rat Int Int

-- | computación de la vista (este caso es simple, )
ratView :: Rational -> RatView
ratView (Rational a b) = Rat a b
