scalarproduct :: Num a => [a] -> [a] -> a
scalarproduct x y = sum [fst a * snd a | a <- zip x y]