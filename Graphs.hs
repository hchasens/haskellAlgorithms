
module Graphs where

graphs = do
    putStrLn "Let's make your graph! \n Enter how many nodes you want: "
    ns <- getLine -- Number of nodes n as a string
    let n = read ns :: Int
    putStrLn $ "Nodes registered: " ++ show n
    let nodes = [1..n]

    putStrLn "Done!"

    

test = do
    putStrLn "Graph Test"

