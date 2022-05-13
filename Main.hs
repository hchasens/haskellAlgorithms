import Sorts
import Graphs

main = do
    putStrLn "Imput your choice: 'Sorts' or 'Graphs' (Sort was never finished, please stick to Graph)"
    choice <- getLine
    if choice == "Graphs" then Graphs.graphs
    else if choice == "Sorts" then Sorts.sorts
    else do Main.main

    