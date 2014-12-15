module Rx.Concurrency.Scheduler where

import Data.Foreign.OOFFI
import Control.Monad.Eff

foreign import data Scheduler :: *
foreign import data Schedule :: !

scheduleRecursive :: forall a e. (a -> Eff e Unit) -> Scheduler -> Eff e Unit
scheduleRecursive = flip $ method1Eff "scheduleRecursive"