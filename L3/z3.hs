import Data.List
permutacje :: [Integer] -> [[Integer]]
permutacje x = perm2 x []

perm2 :: [Integer] -> [Integer] -> [[Integer]]
perm2 lis acc
	| lis == [] = [acc]
    | otherwise = foldl1 (++) [(perm2 (Data.List.delete x lis) (acc ++ [x])) | x <- lis]