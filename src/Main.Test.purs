module Main where

import Test.Chai(expect, toEqual)
import Test.Mocha(describe, it)

main = describe "rx" $ it "moo" $ expect true `toEqual` true 