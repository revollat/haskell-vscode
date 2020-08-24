{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

module Main where

import Lib
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

{- main :: IO ()
main = someFunc -}


myCircle :: Diagram B
myCircle = circle 1

main :: IO ()
main = mainWith myCircle