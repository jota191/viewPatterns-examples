{-# LANGUAGE ViewPatterns #-}

module SequenceClient where
import Prelude hiding (head, tail, size)
import Sequence

-- | example
l = append (cons 1 (snoc (cons 2 (cons 3 empty)) 4))
           (snoc (append (wrap 5) (wrap 6) ) 7)

size :: Sequence a -> Integer
size (listview -> NilV) = 0
size (listview -> ConsV a s) = 1 + size s

-- | head
head :: Sequence a -> a
head (listview -> ConsV a _) = a

-- | tail
tail :: Sequence a -> Sequence a
tail (listview -> ConsV _ t) = t

-- tail l == Append (Snoc (Cons 2 (Cons 3 EmptySeq)) 4)
--                  (Snoc (Append (Cons 5 EmptySeq) (Cons 6 EmptySeq)) 7)
