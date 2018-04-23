sum' :: (Num a) => [a] -> a
sum' xs = foldl1 (+) xs

sum'' :: (Num a) => [a] -> a
sum'' xs = foldl1 (\acc x -> acc + x) xs

sum''' :: (Num a) => [a] -> [a]
sum''' xs = scanl1 (+) xs
