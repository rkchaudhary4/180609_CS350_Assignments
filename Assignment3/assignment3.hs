quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort[a | a <- xs, a <= x] ++ [x] ++ quicksort[a | a <- xs, a > x]

uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:xs) = x:uniq([y | y <- xs, (y /= x)])

neighbors :: (Ord a1, Ord a2, Num a1, Num a2) => a1 -> a2 -> [(a1, a2)]
neighbors a1 a2 = [(x, y) | x <- [a1-1, a1, a1+1], y<-[a2-1, a2, a2+1], (x>= 0 && x<10), (y>=0 && y<10), (x /= a1 || y /= a2)]

nwords:: String -> Int
nwords s = sum (map(\x -> length (words x))(lines s))

compose_multiple :: [b->b] -> b -> b
compose_multiple [] val = val
compose_multiple (x:xs) val = x (compose_multiple xs val)

data BinaryTree a = Nil | Node a (BinaryTree a) (BinaryTree a) deriving Show
mapTree :: ( a -> b ) -> BinaryTree a -> BinaryTree b
mapTree _ Nil = Nil
mapTree f (Node val l r) = Node (f val) (mapTree f l) (mapTree f r)

foldTree :: (a -> b -> b -> b) -> b -> BinaryTree a -> b
foldTree f id Nil = id
foldTree f id (Node val l r) = f  val (foldTree f id l) (foldTree f id r)