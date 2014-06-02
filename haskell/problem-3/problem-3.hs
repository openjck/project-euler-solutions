import Utilities.List
import Utilities.Math

gpf :: Integer -> Integer
gpf n = last primeFactors
    where primeFactors = filter (isPrime) (factors n)

isPrime :: Integer -> Bool
isPrime n = none (\x -> x `isFactorOf` n) [2..(flooredSquareRoot n)]

flooredSquareRoot :: Integer -> Integer
flooredSquareRoot = floor . sqrt . fromIntegral

factors :: Integer -> [Integer]
factors n = foldr concatFactors [] [1..(flooredSquareRoot n)]
    where concatFactors x acc =
              if (x `isFactorOf` n)
                  then if (n `div` x == x)
                      then x : acc
                      else x : acc ++ [n `div` x]
                  else acc

answer = gpf 600851475143
main = print answer
