module Tree where

--Binary Tree structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

myTree = Node 104 (Node 71 (Node 17 (Node 3 Empty Empty) (Node 18 Empty Empty)) (Node 91 Empty Empty)) (Node 240 (Node 108 Empty (Node 110 Empty Empty)) (Node 245 Empty Empty))

--Insert a new node into a tree
--insert_node (Value to insert) (Tree)
insert_node :: (Ord a) => a -> Tree a -> Tree a
insert_node node Empty = Node node Empty Empty
insert_node node (Node root left right)
 | node <= root = Node root (insert_node node left) right
 | node > root = Node root left (insert_node node right)
