split :: [Integer] -> ([Integer], [Integer])
split x = ((split2 x 0), (split2 x 1))
	
split2 :: [Integer] -> Integer -> [Integer]
split2 arr acc
	| arr == [] = []
	| acc `mod` 2 == 0 = (head arr):(split2 (tail arr) (acc+1)) 
	| otherwise = (split2 (tail arr) (acc+1))
	
	