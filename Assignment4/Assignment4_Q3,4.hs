fib::[Integer]
fib = 0:1:zipWith (+) fib (tail fib)

fibonacci::Int -> Integer
fibonacci n 
        | n < 0 = error "Not valid n"
        |  otherwise = last (take (n+1) fib)

iInteractiveWithDo = takeSum 0
    where  
        takeSum n = do
            x <- getLine
            let y = (read x :: Int)
            if y == -1
                then print(n)
            else
                takeSum (n+y)

interactiveWithoutDo = takeSum 0
    where
        takeSum n = getLine >>= (\x -> if (read x ::Int) == -1 then print(n) else takeSum (n + (read x :: Int)))