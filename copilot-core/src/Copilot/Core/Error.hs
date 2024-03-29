--------------------------------------------------------------------------------
-- Copyright © 2011 National Institute of Aerospace / Galois, Inc.
--------------------------------------------------------------------------------

{-# LANGUAGE Safe #-}

-- | Custom functions to report error messages to users.
module Copilot.Core.Error
  ( impossible
  , badUsage ) where

import qualified Copilot.Core.ErrorInternal as Err

-- | Report an error due to a bug in Copilot.
{-# DEPRECATED impossible "This function is deprecated in Copilot 3.6." #-}
impossible :: String -- ^ Name of the function in which the error was detected.
           -> String -- ^ Name of the package in which the function is located.
           -> a
impossible = Err.impossible

-- | Report an error due to an error detected by Copilot (e.g., user error).
{-# DEPRECATED badUsage "This function is deprecated in Copilot 3.6." #-}
badUsage :: String -- ^ Description of the error.
         -> a
badUsage = Err.badUsage
