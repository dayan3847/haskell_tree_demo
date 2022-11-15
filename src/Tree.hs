module Tree where

--Binary Tree structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

myTree = Node 104 (Node 71 (Node 17 (Node 3 Empty Empty) (Node 18 Empty Empty)) (Node 91 Empty Empty)) (Node 240 (Node 108 Empty (Node 110 Empty Empty)) (Node 245 Empty Empty))
