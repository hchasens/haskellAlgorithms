
module Sorts where


sorts = do
    print "Sorts Running"

mergeSrt :: [a] -> [a] -> [a]
mergeSrt [] xs = xs
mergeSrt xs [] = xs


