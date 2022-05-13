import Sorts
import Graphs

main = do
    putStrLn "Imput your choice: 'Sorts' or 'Graphs'"
    choice <- getLine
    if choice == "Graphs" then Graphs.graphs
    else if choice == "Sorts" then Sorts.sorts
    else do Main.main

    