module Tree where

--Binary Tree structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

my_tree = Node 104 (Node 71 (Node 17 (Node 3 Empty Empty) (Node 18 Empty Empty)) (Node 91 Empty Empty)) (Node 240 (Node 108 Empty (Node 110 Empty Empty)) (Node 245 Empty Empty))

--Insert a new node into a tree
--insert_node (Value to insert) (Tree)
insert_node :: (Ord a) => a -> Tree a -> Tree a
insert_node node Empty = Node node Empty Empty
insert_node node (Node root left right)
 | node <= root = Node root (insert_node node left) right
 | node > root = Node root left (insert_node node right)

--Returns True or False if the node is in the tree
--search_node (Value to search) (Tree)
search_node :: (Ord a) => a -> Tree a -> Bool
search_node searched Empty = False
search_node searched (Node root left right)
 | searched == root = True
 | searched < root = search_node searched left
 | otherwise = search_node searched right

--Count the number of nodes in the tree
--count_nodes (Tree)
count_nodes :: (Num a) => Tree t -> a
count_nodes Empty = 0
count_nodes (Node _ left right) = 1 + count_nodes left + count_nodes right

--Count the number of leaves (nodes without children) in the tree
--count_leaves (Tree)
count_leaves :: (Ord a) => Tree a -> Int
count_leaves Empty = 0
count_leaves (Node actual Empty Empty) = 1
count_leaves (Node actual left right) = count_leaves left + count_leaves right

--Returns the height of the tree (number of levels from the root to the lowest leaf)
--tree_height (Tree)
tree_height :: (Ord a) => Tree a -> Int
tree_height Empty = 0
tree_height (Node _ left right) = 1 + max (tree_height left) (tree_height right)

--Returns a list of the nodes in preorder (root, left, right)
--preorder (Tree)
preorder :: (Ord a) => Tree a -> [a]
preorder Empty = []
preorder (Node root left right) = [root] ++ preorder left ++ preorder right

--Returns a list of the nodes in inorder (left, root, right)
--inorder (Tree)
inorder :: (Ord a) => Tree a -> [a]
inorder Empty = []
inorder (Node root left right) = inorder left ++ [root] ++ inorder right

--Returns a list of the nodes in postorder (left, right, root)
--postorder (Tree)
postorder :: (Ord a) => Tree a -> [a]
postorder Empty = []
postorder (Node root left right) = postorder left ++ postorder right ++ [root]
