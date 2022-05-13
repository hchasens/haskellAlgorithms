# haskellAlgorithms

Some general algorithms implemented in Haskell

#### Warning - This program has no input sanitation

To run this project you can either compile or run it from `ghci`. To compile simply type `ghc main` then run the executable. To run without compiling run `ghci` then, once in, type, `:l main` then `main`.

Unfortunately `Sorts` was never completed. As such it’s a dead module. Please type `Graphs` after entering the program.

This project, despite being small took more time than I’d like to admit. Unfortunately, it’s not complete.
Features to be added:
    - Sorting algorithm section
    - Take input from files
    - Improved graphical output

Complications I ran into:
    - Library Limitations: Haskell has multiple graph libraries. Unfortunately, the one I started the project with is rather limiting. Due to the difference in data structures (adjacency matrix vs linked pointers) it’s imposable to change libraries this late into the project while staying in the time frame.
    - Forests: Parts of the Forest constructer where not exported. I had to import an adjacent library to work with them. That took a few hours to figure out. I thought the library was of a much higher level and didn’t think I’d get close to the protected values. It was very frustrating to see the value I wanted on my screen via `print` but was unable to pull into my program.