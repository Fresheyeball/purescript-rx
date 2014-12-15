module Main where

import Test.Chai(expect, toEqual)
import Test.Mocha(describe, it)

main = do 
  Rx.Concurrency.Scheduler.Test.init