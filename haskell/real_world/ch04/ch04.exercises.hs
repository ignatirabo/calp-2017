-- 1.
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTaiñ (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit (x:xs) = Just $ init xs

-- 2.
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p (x:y:ys) = case (p x, p y) of
                         (True, True) -> x : (splitWith p (y:ys))
                         (True, False) -> (x : []) : (splitWith p ys)
                         (False, True) -> splitWith p (y:ys)
                         (False, False) -> splitWith p ys
 
