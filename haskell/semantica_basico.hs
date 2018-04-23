-- 1.
seq0 = let seqn = \n -> n : seqn (n + 1) in seqn 0

seqnm :: Int -> Int -> [Int]
seqnm n m = map (+n) $ take (m-n+1) seq0

seq1 :: Int -> [Int]
seq1 n = drop n seq0

conseq :: [(Int, Int)]
conseq = map (\x -> (x, x+1)) seq0

conseq' :: [(Int, Int)]
conseq' = zip seq0 (drop 1 seq0)

nsum :: Int -> Int
nsum n = sum $ take n seq0

-- 2.
tr :: [(Int,Int,Int)]
tr = [ (i,j,k) | i <- [1..24],
                 j <- [1..24],
                 k <- [1..24],
                 (i + j + k) <= 24,
                 i*i == j*j + k*k ]

-- 3.
data Tree a = Empty | Branch (Tree a) a (Tree a) deriving Show

mapT :: (a -> a) -> Tree a -> Tree a
mapT f t = case t of {
             Empty -> Empty ;
             (Branch l a r) -> Branch (mapT f l) (f a) (mapT f r)
           }

-- Es un foldl
foldT :: (b -> a -> b) -> b -> Tree a -> b
foldT f b Empty = b
foldT f b (Branch l a r) = foldT f (f (foldT f b l) a) r

-- 4.
fun4 x = negate . tan . cos $ max 100 x
