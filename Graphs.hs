module Graphs where

import Data.Graph
import Data.Tree
import System.IO
import Control.Monad
import Data.Foldable


forestDecode :: Forest a -> [a]
forestDecode x = toList $ head x -- can only decode a Forest with n = 1 root (but in this case that's all we'll probably have)
-- forestDecode = concatMap toList -- no sperator between trees

--locDfs :: Graph -> Int -> IO () -- Local version of dfs for library dfs call
--locDfs graph root = print $ forestDecode $ Data.Graph.dfs graph [root]  -- print (the decoded forest of (dfs of (graph, starting at root)))

-- Primes the dfs algorithm
dfsPrimer :: Graph -> IO ()
dfsPrimer graph = do
    putStrLn "Enter Root Num: "
    ns <- getLine
    let n = read ns :: Int 
    print $ forestDecode $ dfs graph [n]


-- Primes the reachable algorithm
reachablePrimer :: Graph -> IO ()
reachablePrimer graph = do
    putStrLn "Enter Root Num: "
    ns <- getLine
    let n = read ns :: Int 
    print $ reachable graph n


-- Primes the path algorithm
pathPrimer :: Graph -> IO ()
pathPrimer graph = do
    putStrLn "Enter x node num: "
    xstr <- getLine
    let x = read xstr :: Int
    putStrLn "Enter y node num: "
    ystr <- getLine
    let y = read ystr :: Int 
    print $ path graph x y


levelsPrimer :: Graph -> IO ()
levelsPrimer graph = do
    putStrLn "Enter Root Num: "
    ns <- getLine
    let n = read ns :: Int 
    print $ levels $ head $ dfs graph [n] -- dfs returns a forest, levels takes a tree, take the first tree (there's only gonan be one becaues only 1 root) and show levels


graphs = do
    putStrLn "Enter how many nodes you wish to create: "
    ns <- getLine   -- gets n as a string
    let n = read ns :: Int -- converts n to int

    let nodesN = [0..(n-1)] -- creat a list from 1 - n to represent nodes
    graphU <- forM nodesN (\a -> do -- for each n get a list of edges and return a list of n's with it's list of edges - U = usermade
        putStrLn $ "Enter Edges for node " ++ show a ++ ". E.g entering '1 5 2' would create edges between nodes 1, 5 and 2."
        edgesS <- getLine
        let edges =  map (read::String->Int) (words edgesS) -- convert string to list of ints
        return (a, a, edges) -- Returns a list of tuples with the name of the node and it's edges
        )
    print $ "User created graph: " ++ show graphU -- print user made graph
    let (graph, nodeFromVertex, vertexFromKey) = graphFromEdges graphU -- from user made graph generate proper graph data structure
    print $ "Haskell generated graph: " ++ show graph
   {-
    putStrLn "Enter the name of your graph file! The format should be that of an adjacency list. An example will follow: \n n1 n2 n3 \n n2 n1 \n n3 n2"
    putStrLn "In this example there are three nodes, n1, n2, and n3. n1 has an edge between n2 and n3. n2 only has an edge with n1, and n3 only has an edge with n2. \n Enter File Name: "
    fileName <- getLine
    file <- openFile fileName ReadMode
    -}

    -- Start of option menu

    forever $ do
        graphsMenu graph

    putStrLn "Done!"


graphsMenu :: Graph -> IO ()
graphsMenu graph = do
    putStrLn "Options: \n 1: list vertices \n 2: list edges \n 3: transpose graph for next turn \n 4: dfs \n 5: list reachable nodes from x \n 6: path (returns bool if there's a path from x to y) \n 7: dfs levels (returns a list of lists, each element represnts a node and the eges dfs traversed)"
    putStrLn "Enter Choice Number: "
    ns <- getLine
    let n = read ns :: Int 
    graphsChoice graph n


graphsChoice :: Graph -> Int -> IO ()
graphsChoice graph option
    | option == 1 = print $ vertices graph
    | option == 2 = print $ edges graph
    | option == 3 = graphsMenu $ transposeG graph
    | option == 4 = dfsPrimer graph
    | option == 5 = reachablePrimer graph
    | option == 6 = pathPrimer graph
    | option == 7 = levelsPrimer graph 
    | otherwise = graphsMenu graph