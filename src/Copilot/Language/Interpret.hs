{- Copyright (c) 2011 National Institute of Aerospace / Galois, Inc. -}

{-# LANGUAGE GADTs #-}

-- |

module Copilot.Language.Interpret
  ( Input
  , interpret
  , prettyInterpret 
  , input
  ) where

import Copilot.Core.Type (Typed, typeOf)
import Copilot.Core.Type.Dynamic (toDynF)
import qualified Copilot.Core.Interpret as I
import Copilot.Language.Spec (Spec)
import Copilot.Language.Reify

data Input where
  Input :: Typed a => String -> [a] -> Input

input :: Typed a => String -> [a] -> Input
input = Input

interpret :: Integer -> [Input] -> Spec -> IO ()
interpret = interpret' I.CSV 

-- | Much slower, but pretty-printed interpreter output.  
prettyInterpret :: Integer -> [Input] -> Spec -> IO ()
prettyInterpret = interpret' I.Table

interpret' :: I.Format -> Integer -> [Input] -> Spec -> IO ()
interpret' format i inputs spec = do
  coreSpec <- reify spec
  putStrLn $ I.interpret format (fromIntegral i) exts coreSpec
  where
  exts = map (\ (Input name xs) -> (name, toDynF typeOf xs)) inputs

