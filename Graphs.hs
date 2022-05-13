module Graphs where

import Data.Graph
import System.IO
import Control.Monad



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



    print $ dfs graph [0]

        

    {-
    putStrLn "Enter the name of your graph file! The format should be that of an adjacency list. An example will follow: \n n1 n2 n3 \n n2 n1 \n n3 n2"
    putStrLn "In this example there are three nodes, n1, n2, and n3. n1 has an edge between n2 and n3. n2 only has an edge with n1, and n3 only has an edge with n2. \n Enter File Name: "
    fileName <- getLine
    file <- openFile fileName ReadMode
    -}
    putStrLn "Done!"





test = do
    putStrLn "Graph Test"

