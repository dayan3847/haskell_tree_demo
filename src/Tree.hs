module Tree where

--Binary Tree structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)
