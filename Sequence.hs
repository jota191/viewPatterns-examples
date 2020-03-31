module Sequence (Sequence(), listview, cons, snoc, empty,
                 ListView(NilV, ConsV), append, wrap) where


-- | listas, con append, cons, snoc en O(1)
data Sequence a
  = Cons a (Sequence a)
  | Snoc (Sequence a) a
  | Append (Sequence a) (Sequence a)
  | EmptySeq
  deriving Show

-- | Constructores publicos
cons   = Cons
append = Append
empty  = EmptySeq
snoc   = Snoc

-- | no tienen por qué seguir estructura
wrap a = Cons a EmptySeq


data ListView a
  = ConsV a (Sequence a)
  | NilV

-- | Vista es implementada con listas builtin
listview :: Sequence a -> ListView a
listview (Cons a s)
  = ConsV a s
listview (Snoc s z)
  = case listview s of
      NilV -> ConsV z EmptySeq
      ConsV a s' -> ConsV a (Snoc s' z)
listview (Append s t)
  = case listview s of
      NilV -> listview t
      ConsV a s' -> ConsV a (Append s' t)
listview EmptySeq
  = NilV
