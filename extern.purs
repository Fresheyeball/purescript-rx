module Prelude where
import Prelude ()
import Prim ()
infixr 9 >>>
infixr 9 <<<
infixr 0 $
infixl 0 #
infixr 6 :
infixl 4 <$>
infixl 1 <#>
infixl 4 <*>
infixl 1 >>=
infixl 7 *
infixl 7 /
infixl 7 %
infixl 6 -
infixl 6 +
infix 4 ==
infix 4 /=
infixl 4 <
infixl 4 >
infixl 4 <=
infixl 4 >=
infixl 10 .&.
infixl 10 .|.
infixl 10 .^.
infixr 2 ||
infixr 3 &&
infixr 5 <>
infixr 5 ++
newtype Unit = Unit {  }
data Ordering = LT  | GT  | EQ 
class Semigroup a where
  (<>) :: a -> a -> a
class BoolLike b where
  (&&) :: b -> b -> b
  (||) :: b -> b -> b
  not :: b -> b
class Bits b where
  (.&.) :: b -> b -> b
  (.|.) :: b -> b -> b
  (.^.) :: b -> b -> b
  shl :: b -> Prim.Number -> b
  shr :: b -> Prim.Number -> b
  zshr :: b -> Prim.Number -> b
  complement :: b -> b
class (Prelude.Eq a) <= Ord a where
  compare :: a -> a -> Prelude.Ordering
class Eq a where
  (==) :: a -> a -> Prim.Boolean
  (/=) :: a -> a -> Prim.Boolean
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  (/) :: a -> a -> a
  (%) :: a -> a -> a
  negate :: a -> a
class (Prelude.Applicative m, Prelude.Bind m) <= Monad m where
class (Prelude.Apply m) <= Bind m where
  (>>=) :: forall a b. m a -> (a -> m b) -> m b
class (Prelude.Apply f) <= Applicative f where
  pure :: forall a. a -> f a
class (Prelude.Functor f) <= Apply f where
  (<*>) :: forall a b. f (a -> b) -> f a -> f b
class Functor f where
  (<$>) :: forall a b. (a -> b) -> f a -> f b
class Show a where
  show :: a -> Prim.String
class (Prelude.Semigroupoid a) <= Category a where
  id :: forall t. a t t
class Semigroupoid a where
  (<<<) :: forall b c d. a c d -> a b c -> a b d
foreign import unit :: Prelude.Unit
foreign import (++) :: forall s. (Prelude.Semigroup s) => s -> s -> s
foreign import (>=) :: forall a. (Prelude.Ord a) => a -> a -> Prim.Boolean
foreign import (<=) :: forall a. (Prelude.Ord a) => a -> a -> Prim.Boolean
foreign import (>) :: forall a. (Prelude.Ord a) => a -> a -> Prim.Boolean
foreign import (<) :: forall a. (Prelude.Ord a) => a -> a -> Prim.Boolean
foreign import refIneq :: forall a. a -> a -> Prim.Boolean
foreign import refEq :: forall a. a -> a -> Prim.Boolean
foreign import ap :: forall m a b. (Prelude.Monad m) => m (a -> b) -> m a -> m b
foreign import liftM1 :: forall m a b. (Prelude.Monad m) => (a -> b) -> m a -> m b
foreign import return :: forall m a. (Prelude.Monad m) => a -> m a
foreign import liftA1 :: forall f a b. (Prelude.Applicative f) => (a -> b) -> f a -> f b
foreign import void :: forall f a. (Prelude.Functor f) => f a -> f Prelude.Unit
foreign import (<#>) :: forall f a b. (Prelude.Functor f) => f a -> (a -> b) -> f b
foreign import cons :: forall a. a -> [a] -> [a]
foreign import (:) :: forall a. a -> [a] -> [a]
foreign import (#) :: forall a b. a -> (a -> b) -> b
foreign import ($) :: forall a b. (a -> b) -> a -> b
foreign import (>>>) :: forall a b c d. (Prelude.Semigroupoid a) => a b c -> a c d -> a b d
foreign import asTypeOf :: forall a. a -> a -> a
foreign import const :: forall a b. a -> b -> a
foreign import flip :: forall a b c. (a -> b -> c) -> b -> a -> c
foreign import otherwise :: Prim.Boolean
foreign import instance semigroupoidArr :: Prelude.Semigroupoid Prim.Function
foreign import instance categoryArr :: Prelude.Category Prim.Function
foreign import instance showUnit :: Prelude.Show Prelude.Unit
foreign import instance showString :: Prelude.Show Prim.String
foreign import instance showBoolean :: Prelude.Show Prim.Boolean
foreign import instance showNumber :: Prelude.Show Prim.Number
foreign import instance showArray :: (Prelude.Show a) => Prelude.Show [a]
foreign import instance functorArr :: Prelude.Functor (Prim.Function r)
foreign import instance applyArr :: Prelude.Apply (Prim.Function r)
foreign import instance applicativeArr :: Prelude.Applicative (Prim.Function r)
foreign import instance bindArr :: Prelude.Bind (Prim.Function r)
foreign import instance monadArr :: Prelude.Monad (Prim.Function r)
foreign import instance numNumber :: Prelude.Num Prim.Number
foreign import instance eqUnit :: Prelude.Eq Prelude.Unit
foreign import instance eqString :: Prelude.Eq Prim.String
foreign import instance eqNumber :: Prelude.Eq Prim.Number
foreign import instance eqBoolean :: Prelude.Eq Prim.Boolean
foreign import instance eqArray :: (Prelude.Eq a) => Prelude.Eq [a]
foreign import instance eqOrdering :: Prelude.Eq Prelude.Ordering
foreign import instance showOrdering :: Prelude.Show Prelude.Ordering
foreign import instance ordUnit :: Prelude.Ord Prelude.Unit
foreign import instance ordBoolean :: Prelude.Ord Prim.Boolean
foreign import instance ordNumber :: Prelude.Ord Prim.Number
foreign import instance ordString :: Prelude.Ord Prim.String
foreign import instance ordArray :: (Prelude.Ord a) => Prelude.Ord [a]
foreign import instance bitsNumber :: Prelude.Bits Prim.Number
foreign import instance boolLikeBoolean :: Prelude.BoolLike Prim.Boolean
foreign import instance semigroupUnit :: Prelude.Semigroup Prelude.Unit
foreign import instance semigroupString :: Prelude.Semigroup Prim.String
foreign import instance semigroupArr :: (Prelude.Semigroup s') => Prelude.Semigroup (s -> s')
module Prelude.Unsafe where
import Prim ()
import Prelude ()
foreign import unsafeIndex :: forall a. [a] -> Prim.Number -> a
module Global where
import Prim ()
import Prelude ()
foreign import readFloat :: Prim.String -> Prim.Number
foreign import readInt :: Prim.Number -> Prim.String -> Prim.Number
foreign import isFinite :: Prim.Number -> Prim.Boolean
foreign import infinity :: Prim.Number
foreign import isNaN :: Prim.Number -> Prim.Boolean
foreign import nan :: Prim.Number
module Data.Function where
import Prim ()
import Prelude ()
foreign import data Fn10 :: * -> * -> * -> * -> * -> * -> * -> * -> * -> * -> * -> *
foreign import data Fn9 :: * -> * -> * -> * -> * -> * -> * -> * -> * -> * -> *
foreign import data Fn8 :: * -> * -> * -> * -> * -> * -> * -> * -> * -> *
foreign import data Fn7 :: * -> * -> * -> * -> * -> * -> * -> * -> *
foreign import data Fn6 :: * -> * -> * -> * -> * -> * -> * -> *
foreign import data Fn5 :: * -> * -> * -> * -> * -> * -> *
foreign import data Fn4 :: * -> * -> * -> * -> * -> *
foreign import data Fn3 :: * -> * -> * -> * -> *
foreign import data Fn2 :: * -> * -> * -> *
foreign import data Fn1 :: * -> * -> *
foreign import data Fn0 :: * -> *
foreign import runFn10 :: forall a b c d e f g h i j k. Data.Function.Fn10 a b c d e f g h i j k -> a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> k
foreign import runFn9 :: forall a b c d e f g h i j. Data.Function.Fn9 a b c d e f g h i j -> a -> b -> c -> d -> e -> f -> g -> h -> i -> j
foreign import runFn8 :: forall a b c d e f g h i. Data.Function.Fn8 a b c d e f g h i -> a -> b -> c -> d -> e -> f -> g -> h -> i
foreign import runFn7 :: forall a b c d e f g h. Data.Function.Fn7 a b c d e f g h -> a -> b -> c -> d -> e -> f -> g -> h
foreign import runFn6 :: forall a b c d e f g. Data.Function.Fn6 a b c d e f g -> a -> b -> c -> d -> e -> f -> g
foreign import runFn5 :: forall a b c d e f. Data.Function.Fn5 a b c d e f -> a -> b -> c -> d -> e -> f
foreign import runFn4 :: forall a b c d e. Data.Function.Fn4 a b c d e -> a -> b -> c -> d -> e
foreign import runFn3 :: forall a b c d. Data.Function.Fn3 a b c d -> a -> b -> c -> d
foreign import runFn2 :: forall a b c. Data.Function.Fn2 a b c -> a -> b -> c
foreign import runFn1 :: forall a b. Data.Function.Fn1 a b -> a -> b
foreign import runFn0 :: forall a. Data.Function.Fn0 a -> a
foreign import mkFn10 :: forall a b c d e f g h i j k. (a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> k) -> Data.Function.Fn10 a b c d e f g h i j k
foreign import mkFn9 :: forall a b c d e f g h i j. (a -> b -> c -> d -> e -> f -> g -> h -> i -> j) -> Data.Function.Fn9 a b c d e f g h i j
foreign import mkFn8 :: forall a b c d e f g h i. (a -> b -> c -> d -> e -> f -> g -> h -> i) -> Data.Function.Fn8 a b c d e f g h i
foreign import mkFn7 :: forall a b c d e f g h. (a -> b -> c -> d -> e -> f -> g -> h) -> Data.Function.Fn7 a b c d e f g h
foreign import mkFn6 :: forall a b c d e f g. (a -> b -> c -> d -> e -> f -> g) -> Data.Function.Fn6 a b c d e f g
foreign import mkFn5 :: forall a b c d e f. (a -> b -> c -> d -> e -> f) -> Data.Function.Fn5 a b c d e f
foreign import mkFn4 :: forall a b c d e. (a -> b -> c -> d -> e) -> Data.Function.Fn4 a b c d e
foreign import mkFn3 :: forall a b c d. (a -> b -> c -> d) -> Data.Function.Fn3 a b c d
foreign import mkFn2 :: forall a b c. (a -> b -> c) -> Data.Function.Fn2 a b c
foreign import mkFn1 :: forall a b. (a -> b) -> Data.Function.Fn1 a b
foreign import mkFn0 :: forall a. (Prelude.Unit -> a) -> Data.Function.Fn0 a
foreign import on :: forall a b c. (b -> b -> c) -> (a -> b) -> a -> a -> c
module Data.Foreign.EasyFFI where
import Data.Foreign.EasyFFI ()
import Prim ()
import Prelude ()
foreign import unsafeForeignProcedure :: forall a. [Prim.String] -> Prim.String -> a
foreign import unsafeForeignFunction :: forall t1224. [Prim.String] -> Prim.String -> t1224
module Data.Eq where
import Data.Eq ()
import Prelude ()
import Prim ()
import Prelude ()
newtype Ref (a :: *) = Ref a
foreign import liftRef :: forall a b. (a -> a -> b) -> Data.Eq.Ref a -> Data.Eq.Ref a -> b
foreign import instance eqRef :: Prelude.Eq (Data.Eq.Ref a)
foreign import instance functorRef :: Prelude.Functor Data.Eq.Ref
module Data.Char where
import Prelude ()
import Prim ()
import Prelude ()
data Char
foreign import toCharCode :: Data.Char.Char -> Prim.Number
foreign import fromCharCode :: Prim.Number -> Data.Char.Char
foreign import charString :: Data.Char.Char -> Prim.String
foreign import instance eqChar :: Prelude.Eq Data.Char.Char
foreign import instance ordChar :: Prelude.Ord Data.Char.Char
foreign import instance showChar :: Prelude.Show Data.Char.Char
module Data.String.Unsafe where
import Prim ()
import Prelude ()
import Data.Char ()
foreign import charCodeAt :: Prim.Number -> Prim.String -> Prim.Number
foreign import charAt :: Prim.Number -> Prim.String -> Data.Char.Char
module DOM where
import Prim ()
import Prelude ()
foreign import data DOM :: !
foreign import data NodeList :: *
foreign import data Node :: *
module Control.Monad.Eff where
import Prelude ()
import Control.Monad.Eff ()
import Prim ()
import Prelude ()
type Pure (a :: *) = forall e. Control.Monad.Eff.Eff e a
foreign import data Eff :: # ! -> * -> *
foreign import foreachE :: forall e a. [a] -> (a -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import forE :: forall e. Prim.Number -> Prim.Number -> (Prim.Number -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import whileE :: forall e a. Control.Monad.Eff.Eff e Prim.Boolean -> Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import untilE :: forall e. Control.Monad.Eff.Eff e Prim.Boolean -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import runPure :: forall a. Control.Monad.Eff.Pure a -> a
foreign import bindE :: forall e a b. Control.Monad.Eff.Eff e a -> (a -> Control.Monad.Eff.Eff e b) -> Control.Monad.Eff.Eff e b
foreign import returnE :: forall e a. a -> Control.Monad.Eff.Eff e a
foreign import instance functorEff :: Prelude.Functor (Control.Monad.Eff.Eff e)
foreign import instance applyEff :: Prelude.Apply (Control.Monad.Eff.Eff e)
foreign import instance applicativeEff :: Prelude.Applicative (Control.Monad.Eff.Eff e)
foreign import instance bindEff :: Prelude.Bind (Control.Monad.Eff.Eff e)
foreign import instance monadEff :: Prelude.Monad (Control.Monad.Eff.Eff e)
module Control.Monad.Eff.Ref where
import Control.Monad.Eff.Ref ()
import Prelude ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import data RefVal :: * -> *
foreign import data Ref :: !
foreign import writeRef :: forall s r. Control.Monad.Eff.Ref.RefVal s -> s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | r) Prelude.Unit
foreign import modifyRef :: forall s r. Control.Monad.Eff.Ref.RefVal s -> (s -> s) -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | r) Prelude.Unit
foreign import modifyRef' :: forall s b r. Control.Monad.Eff.Ref.RefVal s -> (s -> { retVal :: b, newState :: s }) -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | r) b
foreign import readRef :: forall s r. Control.Monad.Eff.Ref.RefVal s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | r) s
foreign import newRef :: forall s r. s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | r) (Control.Monad.Eff.Ref.RefVal s)
module Control.Monad.Eff.Ref.Unsafe where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Ref ()
foreign import unsafeRunRef :: forall eff a. Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.Ref | eff) a -> Control.Monad.Eff.Eff eff a
module Control.Monad.Eff.Unsafe where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import unsafeInterleaveEff :: forall eff1 eff2 a. Control.Monad.Eff.Eff eff1 a -> Control.Monad.Eff.Eff eff2 a
module Control.Monad.ST where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import data STRef :: * -> * -> *
foreign import data ST :: * -> !
foreign import runST :: forall a r. (forall h. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a) -> Control.Monad.Eff.Eff r a
foreign import writeSTRef :: forall a h r. Control.Monad.ST.STRef h a -> a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import modifySTRef :: forall a h r. Control.Monad.ST.STRef h a -> (a -> a) -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import readSTRef :: forall a h r. Control.Monad.ST.STRef h a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import newSTRef :: forall a h r. a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Control.Monad.ST.STRef h a)
module Data.Foreign.OOFFI where
import Data.Function ()
import Data.Foreign.OOFFI ()
import Prim ()
import Prelude ()
import Data.Function ()
import Control.Monad.Eff ()
foreign import instantiate5 :: forall t2063 t2064 t2065 t2066 t2067 t2076 t2078. Prim.String -> t2067 -> t2066 -> t2065 -> t2064 -> t2063 -> Control.Monad.Eff.Eff t2078 t2076
foreign import instantiate4 :: forall t2091 t2092 t2093 t2094 t2102 t2103. Prim.String -> t2094 -> t2093 -> t2092 -> t2091 -> Control.Monad.Eff.Eff t2103 t2102
foreign import instantiate3 :: forall t2115 t2116 t2117 t2124 t2125. Prim.String -> t2117 -> t2116 -> t2115 -> Control.Monad.Eff.Eff t2124 t2125
foreign import instantiate2 :: forall t2135 t2136 t2142 t2143. Prim.String -> t2136 -> t2135 -> Control.Monad.Eff.Eff t2142 t2143
foreign import instantiate1 :: forall t2151 t2156 t2157. Prim.String -> t2151 -> Control.Monad.Eff.Eff t2156 t2157
foreign import instantiate0 :: forall a e. Prim.String -> Control.Monad.Eff.Eff e a
foreign import setter :: forall t1765 t1766 t1767. Prim.String -> t1767 -> t1766 -> t1765
foreign import modifier :: forall t1780 t1781 t1782. Prim.String -> t1782 -> t1781 -> t1780
foreign import getter :: forall t2163 t2164. Prim.String -> t2164 -> t2163
foreign import method5Eff :: forall t1800 t1801 t1802 t1803 t1804 t1805 t1815 t1816. Prim.String -> t1805 -> t1804 -> t1803 -> t1802 -> t1801 -> t1800 -> Control.Monad.Eff.Eff t1815 t1816
foreign import method5 :: forall t1832 t1833 t1834 t1835 t1836 t1837 t1838. Prim.String -> t1838 -> t1837 -> t1836 -> t1835 -> t1834 -> t1833 -> t1832
foreign import method4Eff :: forall t1863 t1864 t1865 t1866 t1867 t1876 t1877. Prim.String -> t1867 -> t1866 -> t1865 -> t1864 -> t1863 -> Control.Monad.Eff.Eff t1876 t1877
foreign import method4 :: forall t1891 t1892 t1893 t1894 t1895 t1896. Prim.String -> t1896 -> t1895 -> t1894 -> t1893 -> t1892 -> t1891
foreign import method3Eff :: forall t1918 t1919 t1920 t1921 t1929 t1930. Prim.String -> t1921 -> t1920 -> t1919 -> t1918 -> Control.Monad.Eff.Eff t1929 t1930
foreign import method3 :: forall t1942 t1943 t1944 t1945 t1946. Prim.String -> t1946 -> t1945 -> t1944 -> t1943 -> t1942
foreign import method2Eff :: forall t1965 t1966 t1967 t1974 t1975. Prim.String -> t1967 -> t1966 -> t1965 -> Control.Monad.Eff.Eff t1974 t1975
foreign import method2 :: forall t1985 t1986 t1987 t1988. Prim.String -> t1988 -> t1987 -> t1986 -> t1985
foreign import method1Eff :: forall t2004 t2005 t2011 t2012. Prim.String -> t2005 -> t2004 -> Control.Monad.Eff.Eff t2011 t2012
foreign import method1 :: forall t2020 t2021 t2022. Prim.String -> t2022 -> t2021 -> t2020
foreign import method0Eff :: forall t2035 t2040 t2041. Prim.String -> t2035 -> Control.Monad.Eff.Eff t2040 t2041
foreign import method0 :: forall t2047 t2048. Prim.String -> t2048 -> t2047
module Debug.Trace where
import Debug.Trace ()
import Prelude ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import data Trace :: !
foreign import print :: forall a r. (Prelude.Show a) => a -> Control.Monad.Eff.Eff (trace :: Debug.Trace.Trace | r) Prelude.Unit
foreign import trace :: forall r. Prim.String -> Control.Monad.Eff.Eff (trace :: Debug.Trace.Trace | r) Prelude.Unit
module Rx.Concurrency.Scheduler where
import Prelude ()
import Data.Foreign.OOFFI ()
import Prim ()
import Prelude ()
import Data.Foreign.OOFFI ()
import Control.Monad.Eff ()
foreign import data Schedule :: !
foreign import data Scheduler :: *
foreign import scheduleRecursive :: forall a e. (a -> Control.Monad.Eff.Eff e Prelude.Unit) -> Rx.Concurrency.Scheduler.Scheduler -> Control.Monad.Eff.Eff e Prelude.Unit
module Rx.Observable where
import Rx.Observable ()
import Prelude ()
import Data.Foreign.OOFFI ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Data.Foreign.OOFFI ()
import DOM ()
foreign import data RXObservable :: *
foreign import data Observable :: * -> *
foreign import debounce :: forall a. Prim.Number -> Rx.Observable.Observable a -> Rx.Observable.Observable a
foreign import switchLatest :: forall a. Rx.Observable.Observable (Rx.Observable.Observable a) -> Rx.Observable.Observable a
foreign import unwrap :: forall eff a. Rx.Observable.Observable (Control.Monad.Eff.Eff eff a) -> Control.Monad.Eff.Eff eff (Rx.Observable.Observable a)
foreign import scan :: forall a b. Rx.Observable.Observable a -> (a -> b -> b) -> b -> Rx.Observable.Observable b
foreign import fmap :: forall a b. Rx.Observable.Observable a -> (a -> Rx.Observable.Observable b) -> Rx.Observable.Observable b
foreign import map :: forall a b. (a -> b) -> Rx.Observable.Observable a -> Rx.Observable.Observable b
foreign import takeUntil :: forall a b. Rx.Observable.Observable b -> Rx.Observable.Observable a -> Rx.Observable.Observable a
foreign import take :: forall a. Prim.Number -> Rx.Observable.Observable a -> Rx.Observable.Observable a
foreign import concat :: forall a. Rx.Observable.Observable a -> Rx.Observable.Observable a -> Rx.Observable.Observable a
foreign import combineLatest :: forall a b c. (a -> b -> c) -> Rx.Observable.Observable a -> Rx.Observable.Observable b -> Rx.Observable.Observable c
foreign import merge :: forall a. Rx.Observable.Observable a -> Rx.Observable.Observable a -> Rx.Observable.Observable a
foreign import subscribe :: forall eff a. Rx.Observable.Observable a -> (a -> Control.Monad.Eff.Eff eff Prelude.Unit) -> Control.Monad.Eff.Eff eff Prelude.Unit
foreign import empty :: forall a. Rx.Observable.Observable a
foreign import fromArray :: forall a. [a] -> Rx.Observable.Observable a
foreign import just :: forall a. a -> Rx.Observable.Observable a
foreign import observable :: Rx.Observable.RXObservable
foreign import instance observableFunctor :: Prelude.Functor Rx.Observable.Observable
foreign import instance applyObservable :: Prelude.Apply Rx.Observable.Observable
foreign import instance applicativeObservable :: Prelude.Applicative Rx.Observable.Observable
foreign import instance observableBind :: Prelude.Bind Rx.Observable.Observable
foreign import instance monadObservable :: Prelude.Monad Rx.Observable.Observable
foreign import instance semigroupObservable :: Prelude.Semigroup (Rx.Observable.Observable a)
module Test.Chai where
import Data.Foreign.EasyFFI ()
import Test.Chai ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Data.Foreign.EasyFFI ()
type ErrorExpectation = forall eff. Test.Chai.Expect -> Test.Chai.Error -> Control.Monad.Eff.Eff (chai :: Test.Chai.Chai | eff) Prelude.Unit
type Expectation = forall a e. Test.Chai.Expect -> a -> Control.Monad.Eff.Eff (chai :: Test.Chai.Chai | e) Prelude.Unit
data Expect = Expect 
data Error = Error 
foreign import data Chai :: !
foreign import toNotThrow :: Test.Chai.ErrorExpectation
foreign import toThrow :: Test.Chai.ErrorExpectation
foreign import toNotInclude :: Test.Chai.Expectation
foreign import toInclude :: Test.Chai.Expectation
foreign import toNotBeAtMost :: Test.Chai.Expectation
foreign import toBeAtMost :: Test.Chai.Expectation
foreign import toNotBeBelow :: Test.Chai.Expectation
foreign import toBeBelow :: Test.Chai.Expectation
foreign import toNotBeAtLeast :: Test.Chai.Expectation
foreign import toBeAtLeast :: Test.Chai.Expectation
foreign import toNotBeAbove :: Test.Chai.Expectation
foreign import toBeAbove :: Test.Chai.Expectation
foreign import toNotEql :: Test.Chai.Expectation
foreign import toEql :: Test.Chai.Expectation
foreign import toNotDeepEqual :: Test.Chai.Expectation
foreign import toDeepEqual :: Test.Chai.Expectation
foreign import toNotEqual :: Test.Chai.Expectation
foreign import toEqual :: Test.Chai.Expectation
foreign import expect :: forall a. a -> Test.Chai.Expect
module Test.Mocha where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import data After :: !
foreign import data Before :: !
data DoneToken = DoneToken 
foreign import data Done :: !
type DoIt = forall e a. Prim.String -> Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (it :: Test.Mocha.It | e) Prelude.Unit
foreign import data It :: !
type DoDescribe = forall e a. Prim.String -> Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (describe :: Test.Mocha.Describe | e) Prelude.Unit
foreign import data Describe :: !
foreign import afterEach :: forall e a. Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (after :: Test.Mocha.After | e) Prelude.Unit
foreign import after :: forall e a. Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (after :: Test.Mocha.After | e) Prelude.Unit
foreign import beforeEach :: forall e a. Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (before :: Test.Mocha.Before | e) Prelude.Unit
foreign import before :: forall e a. Control.Monad.Eff.Eff e a -> Control.Monad.Eff.Eff (before :: Test.Mocha.Before | e) Prelude.Unit
foreign import describeOnly :: Test.Mocha.DoDescribe
foreign import describeSkip :: Test.Mocha.DoDescribe
foreign import describe :: Test.Mocha.DoDescribe
foreign import itOnly :: Test.Mocha.DoIt
foreign import itSkip :: Test.Mocha.DoIt
foreign import itAsync :: forall a eff. Prim.String -> (Test.Mocha.DoneToken -> Control.Monad.Eff.Eff (done :: Test.Mocha.Done | eff) a) -> Control.Monad.Eff.Eff (it :: Test.Mocha.It | eff) Prelude.Unit
foreign import it :: Test.Mocha.DoIt
foreign import itIsNot :: forall eff. Test.Mocha.DoneToken -> Control.Monad.Eff.Eff (done :: Test.Mocha.Done | eff) Prelude.Unit
foreign import itIs :: forall eff. Test.Mocha.DoneToken -> Control.Monad.Eff.Eff (done :: Test.Mocha.Done | eff) Prelude.Unit
module Control.Monad where
import Prelude ()
import Control.Monad ()
import Prim ()
import Prelude ()
foreign import unless :: forall m. (Prelude.Monad m) => Prim.Boolean -> m Prelude.Unit -> m Prelude.Unit
foreign import when :: forall m. (Prelude.Monad m) => Prim.Boolean -> m Prelude.Unit -> m Prelude.Unit
foreign import foldM :: forall m a b. (Prelude.Monad m) => (a -> b -> m a) -> a -> [b] -> m a
foreign import replicateM :: forall m a. (Prelude.Monad m) => Prim.Number -> m a -> m [a]
module Control.Lazy where
import Control.Lazy ()
import Prim ()
import Prelude ()
class Lazy2 l where
  defer2 :: forall a b. (Prelude.Unit -> l a b) -> l a b
class Lazy1 l where
  defer1 :: forall a. (Prelude.Unit -> l a) -> l a
class Lazy l where
  defer :: (Prelude.Unit -> l) -> l
foreign import fix2 :: forall l a b. (Control.Lazy.Lazy2 l) => (l a b -> l a b) -> l a b
foreign import fix1 :: forall l a. (Control.Lazy.Lazy1 l) => (l a -> l a) -> l a
foreign import fix :: forall l a. (Control.Lazy.Lazy l) => (l -> l) -> l
module Control.Extend where
import Prelude ()
import Prim ()
import Prelude ()
infixl 1 =>>
infixr 1 <<=
infixr 1 =>=
infixr 1 =<=
class (Prelude.Functor w) <= Extend w where
  (<<=) :: forall b a. (w a -> b) -> w a -> w b
foreign import duplicate :: forall a w. (Control.Extend.Extend w) => w a -> w (w a)
foreign import (=<=) :: forall b a w c. (Control.Extend.Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
foreign import (=>=) :: forall b a w c. (Control.Extend.Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
foreign import (=>>) :: forall b a w. (Control.Extend.Extend w) => w a -> (w a -> b) -> w b
foreign import instance extendArr :: (Prelude.Semigroup w) => Control.Extend.Extend (Prim.Function w)
module Control.Comonad where
import Prim ()
import Prelude ()
import Control.Extend ()
class (Control.Extend.Extend w) <= Comonad w where
  extract :: forall a. w a -> a
module Control.Bind where
import Prelude ()
import Prim ()
import Prelude ()
infixr 1 =<<
infixr 1 >=>
infixr 1 <=<
foreign import ifM :: forall a m. (Prelude.Bind m) => m Prim.Boolean -> m a -> m a -> m a
foreign import join :: forall a m. (Prelude.Bind m) => m (m a) -> m a
foreign import (<=<) :: forall a b c m. (Prelude.Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
foreign import (>=>) :: forall a b c m. (Prelude.Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
foreign import (=<<) :: forall a b m. (Prelude.Bind m) => (a -> m b) -> m a -> m b
module Control.Apply where
import Prelude ()
import Control.Apply ()
import Prim ()
import Prelude ()
infixl 4 <*
infixl 4 *>
foreign import forever :: forall a b f. (Prelude.Apply f) => f a -> f b
foreign import lift5 :: forall a b c d e f g. (Prelude.Apply f) => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g
foreign import lift4 :: forall a b c d e f. (Prelude.Apply f) => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
foreign import lift3 :: forall a b c d f. (Prelude.Apply f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
foreign import lift2 :: forall a b c f. (Prelude.Apply f) => (a -> b -> c) -> f a -> f b -> f c
foreign import (*>) :: forall a b f. (Prelude.Apply f) => f a -> f b -> f b
foreign import (<*) :: forall a b f. (Prelude.Apply f) => f a -> f b -> f a
module Control.Alt where
import Prim ()
import Prelude ()
infixl 3 <|>
class (Prelude.Functor f) <= Alt f where
  (<|>) :: forall a. f a -> f a -> f a
module Control.Plus where
import Prim ()
import Prelude ()
import Control.Alt ()
class (Control.Alt.Alt f) <= Plus f where
  empty :: forall a. f a
module Control.Alternative where
import Prelude ()
import Control.Lazy ()
import Control.Alternative ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Lazy ()
import Control.Plus ()
class (Prelude.Applicative f, Control.Plus.Plus f) <= Alternative f where
foreign import many :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy1 f) => f a -> f [a]
foreign import some :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy1 f) => f a -> f [a]
module Control.MonadPlus where
import Prelude ()
import Control.Plus ()
import Prim ()
import Prelude ()
import Control.Alternative ()
import Control.Plus ()
class (Prelude.Monad m, Control.Alternative.Alternative m) <= MonadPlus m where
foreign import guard :: forall m. (Control.MonadPlus.MonadPlus m) => Prim.Boolean -> m Prelude.Unit
module Data.Either where
import Data.Either ()
import Prelude ()
import Prim ()
import Prelude ()
import Control.Alt ()
data Either (a :: *) (b :: *) = Left a | Right b
foreign import isRight :: forall a b. Data.Either.Either a b -> Prim.Boolean
foreign import isLeft :: forall a b. Data.Either.Either a b -> Prim.Boolean
foreign import either :: forall a b c. (a -> c) -> (b -> c) -> Data.Either.Either a b -> c
foreign import instance functorEither :: Prelude.Functor (Data.Either.Either a)
foreign import instance applyEither :: Prelude.Apply (Data.Either.Either e)
foreign import instance applicativeEither :: Prelude.Applicative (Data.Either.Either e)
foreign import instance altEither :: Control.Alt.Alt (Data.Either.Either e)
foreign import instance bindEither :: Prelude.Bind (Data.Either.Either e)
foreign import instance monadEither :: Prelude.Monad (Data.Either.Either e)
foreign import instance showEither :: (Prelude.Show a, Prelude.Show b) => Prelude.Show (Data.Either.Either a b)
foreign import instance eqEither :: (Prelude.Eq a, Prelude.Eq b) => Prelude.Eq (Data.Either.Either a b)
foreign import instance ordEither :: (Prelude.Ord a, Prelude.Ord b) => Prelude.Ord (Data.Either.Either a b)
module Data.Either.Nested where
import Data.Either ()
import Data.Either.Nested ()
import Prim ()
import Prelude ()
import Data.Either ()
foreign import choice10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d (Data.Either.Either e (Data.Either.Either f (Data.Either.Either g (Data.Either.Either h (Data.Either.Either i j)))))))) -> z
foreign import choice9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d (Data.Either.Either e (Data.Either.Either f (Data.Either.Either g (Data.Either.Either h i))))))) -> z
foreign import choice8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d (Data.Either.Either e (Data.Either.Either f (Data.Either.Either g h)))))) -> z
foreign import choice7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d (Data.Either.Either e (Data.Either.Either f g))))) -> z
foreign import choice6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d (Data.Either.Either e f)))) -> z
foreign import choice5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c (Data.Either.Either d e))) -> z
foreign import choice4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Data.Either.Either a (Data.Either.Either b (Data.Either.Either c d)) -> z
foreign import choice3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Data.Either.Either a (Data.Either.Either b c) -> z
foreign import choice2 :: forall a b z. (a -> z) -> (b -> z) -> Data.Either.Either a b -> z
module Data.Maybe where
import Data.Maybe ()
import Prelude ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Extend ()
import Control.MonadPlus ()
import Control.Plus ()
data Maybe (a :: *) = Nothing  | Just a
foreign import isNothing :: forall a. Data.Maybe.Maybe a -> Prim.Boolean
foreign import isJust :: forall a. Data.Maybe.Maybe a -> Prim.Boolean
foreign import fromMaybe :: forall a. a -> Data.Maybe.Maybe a -> a
foreign import maybe :: forall a b. b -> (a -> b) -> Data.Maybe.Maybe a -> b
foreign import instance functorMaybe :: Prelude.Functor Data.Maybe.Maybe
foreign import instance applyMaybe :: Prelude.Apply Data.Maybe.Maybe
foreign import instance applicativeMaybe :: Prelude.Applicative Data.Maybe.Maybe
foreign import instance altMaybe :: Control.Alt.Alt Data.Maybe.Maybe
foreign import instance plusMaybe :: Control.Plus.Plus Data.Maybe.Maybe
foreign import instance alternativeMaybe :: Control.Alternative.Alternative Data.Maybe.Maybe
foreign import instance bindMaybe :: Prelude.Bind Data.Maybe.Maybe
foreign import instance monadMaybe :: Prelude.Monad Data.Maybe.Maybe
foreign import instance monadPlusMaybe :: Control.MonadPlus.MonadPlus Data.Maybe.Maybe
foreign import instance extendMaybe :: Control.Extend.Extend Data.Maybe.Maybe
foreign import instance semigroupMaybe :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.Maybe.Maybe a)
foreign import instance showMaybe :: (Prelude.Show a) => Prelude.Show (Data.Maybe.Maybe a)
foreign import instance eqMaybe :: (Prelude.Eq a) => Prelude.Eq (Data.Maybe.Maybe a)
foreign import instance ordMaybe :: (Prelude.Ord a) => Prelude.Ord (Data.Maybe.Maybe a)
module Data.Array where
import Prelude ()
import Data.Array ()
import Data.Maybe ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Plus ()
import Control.Alternative ()
import Control.MonadPlus ()
import Data.Maybe ()
import Prelude.Unsafe ()
infixl 8 !!
infix 5 \\
foreign import span :: forall a. (a -> Prim.Boolean) -> [a] -> { rest :: [a], init :: [a] }
foreign import groupBy :: forall a. (a -> a -> Prim.Boolean) -> [a] -> [[a]]
foreign import group' :: forall a. (Prelude.Ord a) => [a] -> [[a]]
foreign import group :: forall a. (Prelude.Eq a) => [a] -> [[a]]
foreign import sortBy :: forall a. (a -> a -> Prelude.Ordering) -> [a] -> [a]
foreign import sort :: forall a. (Prelude.Ord a) => [a] -> [a]
foreign import nubBy :: forall a. (a -> a -> Prim.Boolean) -> [a] -> [a]
foreign import nub :: forall a. (Prelude.Eq a) => [a] -> [a]
foreign import zipWith :: forall a b c. (a -> b -> c) -> [a] -> [b] -> [c]
foreign import range :: Prim.Number -> Prim.Number -> [Prim.Number]
foreign import filter :: forall a. (a -> Prim.Boolean) -> [a] -> [a]
foreign import concatMap :: forall a b. (a -> [b]) -> [a] -> [b]
foreign import intersect :: forall a. (Prelude.Eq a) => [a] -> [a] -> [a]
foreign import intersectBy :: forall a. (a -> a -> Prim.Boolean) -> [a] -> [a] -> [a]
foreign import (\\) :: forall a. (Prelude.Eq a) => [a] -> [a] -> [a]
foreign import delete :: forall a. (Prelude.Eq a) => a -> [a] -> [a]
foreign import deleteBy :: forall a. (a -> a -> Prim.Boolean) -> a -> [a] -> [a]
foreign import updateAt :: forall a. Prim.Number -> a -> [a] -> [a]
foreign import deleteAt :: forall a. Prim.Number -> Prim.Number -> [a] -> [a]
foreign import insertAt :: forall a. Prim.Number -> a -> [a] -> [a]
foreign import take :: forall a. Prim.Number -> [a] -> [a]
foreign import drop :: forall a. Prim.Number -> [a] -> [a]
foreign import reverse :: forall a. [a] -> [a]
foreign import concat :: forall a. [[a]] -> [a]
foreign import append :: forall a. [a] -> [a] -> [a]
foreign import elemLastIndex :: forall a. (Prelude.Eq a) => a -> [a] -> Prim.Number
foreign import elemIndex :: forall a. (Prelude.Eq a) => a -> [a] -> Prim.Number
foreign import findLastIndex :: forall a. (a -> Prim.Boolean) -> [a] -> Prim.Number
foreign import findIndex :: forall a. (a -> Prim.Boolean) -> [a] -> Prim.Number
foreign import length :: forall a. [a] -> Prim.Number
foreign import catMaybes :: forall a. [Data.Maybe.Maybe a] -> [a]
foreign import mapMaybe :: forall a b. (a -> Data.Maybe.Maybe b) -> [a] -> [b]
foreign import map :: forall a b. (a -> b) -> [a] -> [b]
foreign import null :: forall a. [a] -> Prim.Boolean
foreign import init :: forall a. [a] -> Data.Maybe.Maybe [a]
foreign import tail :: forall a. [a] -> Data.Maybe.Maybe [a]
foreign import last :: forall a. [a] -> Data.Maybe.Maybe a
foreign import head :: forall a. [a] -> Data.Maybe.Maybe a
foreign import singleton :: forall a. a -> [a]
foreign import snoc :: forall a. [a] -> a -> [a]
foreign import (..) :: Prim.Number -> Prim.Number -> [Prim.Number]
foreign import (!!) :: forall a. [a] -> Prim.Number -> Data.Maybe.Maybe a
foreign import instance functorArray :: Prelude.Functor Prim.Array
foreign import instance applyArray :: Prelude.Apply Prim.Array
foreign import instance applicativeArray :: Prelude.Applicative Prim.Array
foreign import instance bindArray :: Prelude.Bind Prim.Array
foreign import instance monadArray :: Prelude.Monad Prim.Array
foreign import instance semigroupArray :: Prelude.Semigroup [a]
foreign import instance altArray :: Control.Alt.Alt Prim.Array
foreign import instance plusArray :: Control.Plus.Plus Prim.Array
foreign import instance alternativeArray :: Control.Alternative.Alternative Prim.Array
foreign import instance monadPlusArray :: Control.MonadPlus.MonadPlus Prim.Array
module Data.Foreign where
import Prelude ()
import Data.Function ()
import Data.Foreign ()
import Prim ()
import Prelude ()
import Data.Array ()
import Data.Either ()
import Data.Function ()
type F = Data.Either.Either Data.Foreign.ForeignError
data ForeignError = TypeMismatch Prim.String Prim.String | ErrorAtIndex Prim.Number Data.Foreign.ForeignError | ErrorAtProperty Prim.String Data.Foreign.ForeignError | JSONError Prim.String
foreign import data Foreign :: *
foreign import readArray :: Data.Foreign.Foreign -> Data.Foreign.F [Data.Foreign.Foreign]
foreign import readNumber :: Data.Foreign.Foreign -> Data.Foreign.F Prim.Number
foreign import readBoolean :: Data.Foreign.Foreign -> Data.Foreign.F Prim.Boolean
foreign import readString :: Data.Foreign.Foreign -> Data.Foreign.F Prim.String
foreign import isArray :: Data.Foreign.Foreign -> Prim.Boolean
foreign import isUndefined :: Data.Foreign.Foreign -> Prim.Boolean
foreign import isNull :: Data.Foreign.Foreign -> Prim.Boolean
foreign import tagOf :: Data.Foreign.Foreign -> Prim.String
foreign import typeOf :: Data.Foreign.Foreign -> Prim.String
foreign import unsafeFromForeign :: forall a. Data.Foreign.Foreign -> a
foreign import toForeign :: forall a. a -> Data.Foreign.Foreign
foreign import parseJSON :: Prim.String -> Data.Foreign.F Data.Foreign.Foreign
foreign import instance showForeignError :: Prelude.Show Data.Foreign.ForeignError
foreign import instance eqForeignError :: Prelude.Eq Data.Foreign.ForeignError
module Control.Monad.JQuery where
import Prim ()
import Prelude ()
import Data.Foreign ()
import Control.Monad.Eff ()
import DOM ()
foreign import data JQueryEvent :: *
foreign import data JQuery :: *
foreign import stopImmediatePropagation :: forall eff. Control.Monad.JQuery.JQueryEvent -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Prelude.Unit
foreign import stopPropagation :: forall eff. Control.Monad.JQuery.JQueryEvent -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Prelude.Unit
foreign import preventDefault :: forall eff. Control.Monad.JQuery.JQueryEvent -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Prelude.Unit
foreign import on' :: forall eff a. Prim.String -> Prim.String -> (Control.Monad.JQuery.JQueryEvent -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) a) -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import on :: forall eff a. Prim.String -> (Control.Monad.JQuery.JQueryEvent -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) a) -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import setValue :: forall eff a. a -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import getValue :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Data.Foreign.Foreign
foreign import setText :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import getText :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Prim.String
foreign import body :: forall eff. Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import appendText :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import before :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import clear :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import remove :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import appendAtIndex :: forall eff. Prim.Number -> Control.Monad.JQuery.JQuery -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import append :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import getProp :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Data.Foreign.Foreign
foreign import setProp :: forall a eff. Prim.String -> a -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import removeClass :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import addClass :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import hasClass :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Prim.Boolean
foreign import css :: forall eff css. {  | css } -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import attr :: forall eff attr. {  | attr } -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import setAttr :: forall eff a. Prim.String -> a -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import create :: forall eff. Prim.String -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import closest :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import parent :: forall eff. Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import find :: forall eff. Prim.String -> Control.Monad.JQuery.JQuery -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import select :: forall eff. Prim.String -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
foreign import ready :: forall eff a. Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) a -> Control.Monad.Eff.Eff (dom :: DOM.DOM | eff) Control.Monad.JQuery.JQuery
module Data.Foreign.Index where
import Data.Function ()
import Data.Foreign.Index ()
import Data.Foreign ()
import Prelude ()
import Prim ()
import Prelude ()
import Data.Either ()
import Data.Foreign ()
import Data.Function ()
infixl 9 !
class Index i where
  (!) :: Data.Foreign.Foreign -> i -> Data.Foreign.F Data.Foreign.Foreign
  hasProperty :: i -> Data.Foreign.Foreign -> Prim.Boolean
  hasOwnProperty :: i -> Data.Foreign.Foreign -> Prim.Boolean
  errorAt :: i -> Data.Foreign.ForeignError -> Data.Foreign.ForeignError
foreign import index :: Prim.Number -> Data.Foreign.Foreign -> Data.Foreign.F Data.Foreign.Foreign
foreign import prop :: Prim.String -> Data.Foreign.Foreign -> Data.Foreign.F Data.Foreign.Foreign
foreign import instance indexString :: Data.Foreign.Index.Index Prim.String
foreign import instance indexNumber :: Data.Foreign.Index.Index Prim.Number
module Data.Foreign.Keys where
import Data.Foreign ()
import Data.Foreign.Keys ()
import Prim ()
import Prelude ()
import Data.Either ()
import Data.Foreign ()
import Data.Function ()
foreign import keys :: Data.Foreign.Foreign -> Data.Foreign.F [Prim.String]
module Data.Array.ST where
import Data.Function ()
import Data.Array.ST ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Function ()
import Control.Monad.Eff ()
import Control.Monad.ST ()
foreign import data STArray :: * -> * -> *
foreign import pushSTArray :: forall a h r. Data.Array.ST.STArray h a -> a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) Prelude.Unit
foreign import pokeSTArray :: forall a h r. Data.Array.ST.STArray h a -> Prim.Number -> a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) Prim.Boolean
foreign import peekSTArray :: forall a h r. Data.Array.ST.STArray h a -> Prim.Number -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.Maybe.Maybe a)
foreign import emptySTArray :: forall a h r. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.Array.ST.STArray h a)
foreign import runSTArray :: forall a r. (forall h. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.Array.ST.STArray h a)) -> Control.Monad.Eff.Eff r [a]
module Data.Foreign.Null where
import Data.Foreign ()
import Prelude ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Either ()
import Data.Foreign ()
newtype Null (a :: *) = Null (Data.Maybe.Maybe a)
foreign import readNull :: forall a. (Data.Foreign.Foreign -> Data.Foreign.F a) -> Data.Foreign.Foreign -> Data.Foreign.F (Data.Foreign.Null.Null a)
foreign import runNull :: forall a. Data.Foreign.Null.Null a -> Data.Maybe.Maybe a
module Data.Foreign.NullOrUndefined where
import Data.Foreign ()
import Prelude ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Either ()
import Data.Foreign ()
newtype NullOrUndefined (a :: *) = NullOrUndefined (Data.Maybe.Maybe a)
foreign import readNullOrUndefined :: forall a. (Data.Foreign.Foreign -> Data.Foreign.F a) -> Data.Foreign.Foreign -> Data.Foreign.F (Data.Foreign.NullOrUndefined.NullOrUndefined a)
foreign import runNullOrUndefined :: forall a. Data.Foreign.NullOrUndefined.NullOrUndefined a -> Data.Maybe.Maybe a
module Data.Foreign.Undefined where
import Data.Foreign ()
import Prelude ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Either ()
import Data.Foreign ()
newtype Undefined (a :: *) = Undefined (Data.Maybe.Maybe a)
foreign import readUndefined :: forall a. (Data.Foreign.Foreign -> Data.Foreign.F a) -> Data.Foreign.Foreign -> Data.Foreign.F (Data.Foreign.Undefined.Undefined a)
foreign import runUndefined :: forall a. Data.Foreign.Undefined.Undefined a -> Data.Maybe.Maybe a
module Data.Maybe.Unsafe where
import Prim ()
import Prelude ()
import Data.Maybe ()
foreign import fromJust :: forall a. Data.Maybe.Maybe a -> a
module Data.Array.Unsafe where
import Prelude.Unsafe ()
import Data.Array ()
import Data.Maybe.Unsafe ()
import Prim ()
import Prelude ()
import Prelude.Unsafe ()
import Data.Maybe.Unsafe ()
import Data.Array ()
foreign import init :: forall a. [a] -> [a]
foreign import last :: forall a. [a] -> a
foreign import tail :: forall a. [a] -> [a]
foreign import head :: forall a. [a] -> a
module Data.Monoid where
import Prelude ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Data.Array ()
import Data.Maybe ()
class (Prelude.Semigroup m) <= Monoid m where
  mempty :: m
foreign import instance monoidString :: Data.Monoid.Monoid Prim.String
foreign import instance monoidArray :: Data.Monoid.Monoid [a]
foreign import instance monoidUnit :: Data.Monoid.Monoid Prelude.Unit
foreign import instance monoidArr :: (Data.Monoid.Monoid b) => Data.Monoid.Monoid (a -> b)
foreign import instance monoidMaybe :: (Prelude.Semigroup a) => Data.Monoid.Monoid (Data.Maybe.Maybe a)
module Data.Monoid.All where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype All = All Prim.Boolean
foreign import runAll :: Data.Monoid.All.All -> Prim.Boolean
foreign import instance eqAll :: Prelude.Eq Data.Monoid.All.All
foreign import instance showAll :: Prelude.Show Data.Monoid.All.All
foreign import instance semigroupAll :: Prelude.Semigroup Data.Monoid.All.All
foreign import instance monoidAll :: Data.Monoid.Monoid Data.Monoid.All.All
module Data.Monoid.Any where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype Any = Any Prim.Boolean
foreign import runAny :: Data.Monoid.Any.Any -> Prim.Boolean
foreign import instance eqAny :: Prelude.Eq Data.Monoid.Any.Any
foreign import instance showAny :: Prelude.Show Data.Monoid.Any.Any
foreign import instance semigroupAny :: Prelude.Semigroup Data.Monoid.Any.Any
foreign import instance monoidAny :: Data.Monoid.Monoid Data.Monoid.Any.Any
module Data.Monoid.Dual where
import Prelude ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype Dual (a :: *) = Dual a
foreign import runDual :: forall a. Data.Monoid.Dual.Dual a -> a
foreign import instance eqDual :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Dual.Dual a)
foreign import instance ordDual :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Dual.Dual a)
foreign import instance showDual :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Dual.Dual a)
foreign import instance semigroupDual :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.Monoid.Dual.Dual a)
foreign import instance monoidDual :: (Data.Monoid.Monoid a) => Data.Monoid.Monoid (Data.Monoid.Dual.Dual a)
module Data.Monoid.Endo where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype Endo (a :: *) = Endo (a -> a)
foreign import runEndo :: forall a. Data.Monoid.Endo.Endo a -> a -> a
foreign import instance semigroupEndo :: Prelude.Semigroup (Data.Monoid.Endo.Endo a)
foreign import instance monoidEndo :: Data.Monoid.Monoid (Data.Monoid.Endo.Endo a)
module Data.Monoid.Product where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype Product = Product Prim.Number
foreign import runProduct :: Data.Monoid.Product.Product -> Prim.Number
foreign import instance eqProduct :: Prelude.Eq Data.Monoid.Product.Product
foreign import instance ordProduct :: Prelude.Ord Data.Monoid.Product.Product
foreign import instance showProduct :: Prelude.Show Data.Monoid.Product.Product
foreign import instance semigroupProduct :: Prelude.Semigroup Data.Monoid.Product.Product
foreign import instance monoidProduct :: Data.Monoid.Monoid Data.Monoid.Product.Product
module Data.Monoid.Sum where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Monoid ()
newtype Sum = Sum Prim.Number
foreign import runSum :: Data.Monoid.Sum.Sum -> Prim.Number
foreign import instance eqSum :: Prelude.Eq Data.Monoid.Sum.Sum
foreign import instance ordSum :: Prelude.Ord Data.Monoid.Sum.Sum
foreign import instance showSum :: Prelude.Show Data.Monoid.Sum.Sum
foreign import instance semigroupSum :: Prelude.Semigroup Data.Monoid.Sum.Sum
foreign import instance monoidSum :: Data.Monoid.Monoid Data.Monoid.Sum.Sum
module Data.Tuple where
import Prelude ()
import Data.Monoid ()
import Data.Tuple ()
import Control.Lazy ()
import Data.Array ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Control.Lazy ()
import Data.Array ()
import Data.Monoid ()
data Tuple (a :: *) (b :: *) = Tuple a b
foreign import swap :: forall a b. Data.Tuple.Tuple a b -> Data.Tuple.Tuple b a
foreign import unzip :: forall a b. [Data.Tuple.Tuple a b] -> Data.Tuple.Tuple [a] [b]
foreign import zip :: forall a b. [a] -> [b] -> [Data.Tuple.Tuple a b]
foreign import uncurry :: forall a b c. (a -> b -> c) -> Data.Tuple.Tuple a b -> c
foreign import curry :: forall a b c. (Data.Tuple.Tuple a b -> c) -> a -> b -> c
foreign import snd :: forall a b. Data.Tuple.Tuple a b -> b
foreign import fst :: forall a b. Data.Tuple.Tuple a b -> a
foreign import instance showTuple :: (Prelude.Show a, Prelude.Show b) => Prelude.Show (Data.Tuple.Tuple a b)
foreign import instance eqTuple :: (Prelude.Eq a, Prelude.Eq b) => Prelude.Eq (Data.Tuple.Tuple a b)
foreign import instance ordTuple :: (Prelude.Ord a, Prelude.Ord b) => Prelude.Ord (Data.Tuple.Tuple a b)
foreign import instance semigroupoidTuple :: Prelude.Semigroupoid Data.Tuple.Tuple
foreign import instance semigroupTuple :: (Prelude.Semigroup a, Prelude.Semigroup b) => Prelude.Semigroup (Data.Tuple.Tuple a b)
foreign import instance monoidTuple :: (Data.Monoid.Monoid a, Data.Monoid.Monoid b) => Data.Monoid.Monoid (Data.Tuple.Tuple a b)
foreign import instance functorTuple :: Prelude.Functor (Data.Tuple.Tuple a)
foreign import instance applyTuple :: (Prelude.Semigroup a) => Prelude.Apply (Data.Tuple.Tuple a)
foreign import instance applicativeTuple :: (Data.Monoid.Monoid a) => Prelude.Applicative (Data.Tuple.Tuple a)
foreign import instance bindTuple :: (Prelude.Semigroup a) => Prelude.Bind (Data.Tuple.Tuple a)
foreign import instance monadTuple :: (Data.Monoid.Monoid a) => Prelude.Monad (Data.Tuple.Tuple a)
foreign import instance extendTuple :: Control.Extend.Extend (Data.Tuple.Tuple a)
foreign import instance comonadTuple :: Control.Comonad.Comonad (Data.Tuple.Tuple a)
foreign import instance lazyTuple :: (Control.Lazy.Lazy a, Control.Lazy.Lazy b) => Control.Lazy.Lazy (Data.Tuple.Tuple a b)
foreign import instance lazyLazy1Tuple :: (Control.Lazy.Lazy1 l1, Control.Lazy.Lazy1 l2) => Control.Lazy.Lazy (Data.Tuple.Tuple (l1 a) (l2 b))
foreign import instance lazyLazy2Tuple :: (Control.Lazy.Lazy2 l1, Control.Lazy.Lazy2 l2) => Control.Lazy.Lazy (Data.Tuple.Tuple (l1 a b) (l2 c d))
module Data.Enum where
import Data.Enum ()
import Data.Maybe ()
import Prelude ()
import Data.Char ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Either ()
import Data.Tuple ()
import Data.Char ()
import Data.Maybe.Unsafe ()
newtype Cardinality (a :: *) = Cardinality Prim.Number
class (Prelude.Ord a) <= Enum a where
  cardinality :: Data.Enum.Cardinality a
  firstEnum :: a
  lastEnum :: a
  succ :: a -> Data.Maybe.Maybe a
  pred :: a -> Data.Maybe.Maybe a
foreign import toEnum :: forall a. (Data.Enum.Enum a) => Prim.Number -> Data.Maybe.Maybe a
foreign import runCardinality :: forall a. Data.Enum.Cardinality a -> Prim.Number
foreign import fromEnum :: forall a. (Data.Enum.Enum a) => a -> Prim.Number
foreign import instance enumChar :: Data.Enum.Enum Data.Char.Char
foreign import instance enumMaybe :: (Data.Enum.Enum a) => Data.Enum.Enum (Data.Maybe.Maybe a)
foreign import instance enumBoolean :: Data.Enum.Enum Prim.Boolean
foreign import instance enumTuple :: (Data.Enum.Enum a, Data.Enum.Enum b) => Data.Enum.Enum (Data.Tuple.Tuple a b)
foreign import instance enumEither :: (Data.Enum.Enum a, Data.Enum.Enum b) => Data.Enum.Enum (Data.Either.Either a b)
module Data.Date where
import Data.Date ()
import Prelude ()
import Data.Enum ()
import Global ()
import Data.Maybe.Unsafe ()
import Data.Function ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Data.Enum ()
import Data.Maybe ()
import Data.Function ()
import Data.Maybe.Unsafe ()
type Milliseconds = Prim.Number
type Seconds = Prim.Number
type Minutes = Prim.Number
type Hours = Prim.Number
data DayOfWeek
type Day = Prim.Number
data Month = January  | February  | March  | April  | May  | June  | July  | August  | September  | October  | November  | December 
type Year = Prim.Number
data Date
foreign import data Now :: !
foreign import data JSDate :: *
foreign import fromStringStrict :: Prim.String -> Data.Maybe.Maybe Data.Date.Date
foreign import fromString :: Prim.String -> Data.Maybe.Maybe Data.Date.Date
foreign import fromEpochMilliseconds :: Data.Date.Milliseconds -> Data.Maybe.Maybe Data.Date.Date
foreign import toEpochMilliseconds :: Data.Date.Date -> Data.Date.Milliseconds
foreign import timezoneOffset :: Data.Date.Date -> Data.Date.Minutes
foreign import millisecondUTC :: Data.Date.Date -> Data.Date.Seconds
foreign import millisecond :: Data.Date.Date -> Data.Date.Seconds
foreign import secondUTC :: Data.Date.Date -> Data.Date.Seconds
foreign import second :: Data.Date.Date -> Data.Date.Seconds
foreign import minuteUTC :: Data.Date.Date -> Data.Date.Minutes
foreign import minute :: Data.Date.Date -> Data.Date.Minutes
foreign import hourUTC :: Data.Date.Date -> Data.Date.Hours
foreign import hour :: Data.Date.Date -> Data.Date.Hours
foreign import dayOfWeekUTC :: Data.Date.Date -> Data.Date.DayOfWeek
foreign import dayOfWeek :: Data.Date.Date -> Data.Date.DayOfWeek
foreign import dayUTC :: Data.Date.Date -> Data.Date.Day
foreign import day :: Data.Date.Date -> Data.Date.Day
foreign import monthUTC :: Data.Date.Date -> Data.Date.Month
foreign import month :: Data.Date.Date -> Data.Date.Month
foreign import yearUTC :: Data.Date.Date -> Data.Date.Year
foreign import year :: Data.Date.Date -> Data.Date.Year
foreign import date :: Data.Date.Year -> Data.Date.Month -> Data.Date.Day -> Data.Maybe.Maybe Data.Date.Date
foreign import dateTime :: Data.Date.Year -> Data.Date.Month -> Data.Date.Day -> Data.Date.Hours -> Data.Date.Minutes -> Data.Date.Seconds -> Data.Date.Milliseconds -> Data.Maybe.Maybe Data.Date.Date
foreign import now :: forall e. Control.Monad.Eff.Eff (now :: Data.Date.Now | e) Data.Date.Date
foreign import toJSDate :: Data.Date.Date -> Data.Date.JSDate
foreign import fromJSDate :: Data.Date.JSDate -> Data.Maybe.Maybe Data.Date.Date
foreign import instance eqDate :: Prelude.Eq Data.Date.Date
foreign import instance ordDate :: Prelude.Ord Data.Date.Date
foreign import instance eqMonth :: Prelude.Eq Data.Date.Month
foreign import instance ordMonth :: Prelude.Ord Data.Date.Month
foreign import instance enumMonth :: Data.Enum.Enum Data.Date.Month
foreign import instance showMonth :: Prelude.Show Data.Date.Month
foreign import instance eqDayOfWeek :: Prelude.Eq Data.Date.DayOfWeek
foreign import instance ordDayOfWeek :: Prelude.Ord Data.Date.DayOfWeek
foreign import instance enumDayOfWeek :: Data.Enum.Enum Data.Date.DayOfWeek
foreign import instance showDayOfWeek :: Prelude.Show Data.Date.DayOfWeek
foreign import instance showDate :: Prelude.Show Data.Date.Date
module Rx.Concurrency.Scheduler.Test where
import Data.Date ()
import Prelude ()
import Test.Chai ()
import Test.Mocha ()
import Control.Monad.Eff.Ref ()
import Rx.Concurrency.Scheduler.Test ()
import Rx.Concurrency.Scheduler ()
import Prim ()
import Prelude ()
import Rx.Concurrency.Scheduler ()
import Test.Mocha ()
import Test.Chai ()
import Data.Date ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Ref ()
foreign import init :: forall t6232. Control.Monad.Eff.Eff (chai :: Test.Chai.Chai, schedule :: Rx.Concurrency.Scheduler.Schedule, ref :: Control.Monad.Eff.Ref.Ref, it :: Test.Mocha.It, describe :: Test.Mocha.Describe | t6232) Prelude.Unit
foreign import newTestScheduler :: forall e. Prim.Number -> Control.Monad.Eff.Eff (schedule :: Rx.Concurrency.Scheduler.Schedule | e) Rx.Concurrency.Scheduler.Scheduler
foreign import isEq :: forall a e. (Prelude.Eq a) => a -> a -> Control.Monad.Eff.Eff (chai :: Test.Chai.Chai | e) Prelude.Unit
foreign import nowTime :: forall t6168. Control.Monad.Eff.Eff (now :: Data.Date.Now | t6168) Prim.Number
module Main where
import Rx.Concurrency.Scheduler.Test ()
import Prim ()
import Prelude ()
import Test.Chai ()
import Test.Mocha ()
foreign import main :: forall t6232. Control.Monad.Eff.Eff (chai :: Test.Chai.Chai, schedule :: Rx.Concurrency.Scheduler.Schedule, ref :: Control.Monad.Eff.Ref.Ref, it :: Test.Mocha.It, describe :: Test.Mocha.Describe | t6232) Prelude.Unit
module Data.Tuple.Nested where
import Prim ()
import Prelude ()
import Data.Tuple ()
infixr 6 /\
foreign import (/\) :: forall a b. a -> b -> Data.Tuple.Tuple a b
foreign import con10 :: forall a b c d e f g h i j z. (a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d (Data.Tuple.Tuple e (Data.Tuple.Tuple f (Data.Tuple.Tuple g (Data.Tuple.Tuple h (Data.Tuple.Tuple i j)))))))) -> z
foreign import con9 :: forall a b c d e f g h i z. (a -> b -> c -> d -> e -> f -> g -> h -> i -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d (Data.Tuple.Tuple e (Data.Tuple.Tuple f (Data.Tuple.Tuple g (Data.Tuple.Tuple h i))))))) -> z
foreign import con8 :: forall a b c d e f g h z. (a -> b -> c -> d -> e -> f -> g -> h -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d (Data.Tuple.Tuple e (Data.Tuple.Tuple f (Data.Tuple.Tuple g h)))))) -> z
foreign import con7 :: forall a b c d e f g z. (a -> b -> c -> d -> e -> f -> g -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d (Data.Tuple.Tuple e (Data.Tuple.Tuple f g))))) -> z
foreign import con6 :: forall a b c d e f z. (a -> b -> c -> d -> e -> f -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d (Data.Tuple.Tuple e f)))) -> z
foreign import con5 :: forall a b c d e z. (a -> b -> c -> d -> e -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c (Data.Tuple.Tuple d e))) -> z
foreign import con4 :: forall a b c d z. (a -> b -> c -> d -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b (Data.Tuple.Tuple c d)) -> z
foreign import con3 :: forall a b c z. (a -> b -> c -> z) -> Data.Tuple.Tuple a (Data.Tuple.Tuple b c) -> z
foreign import con2 :: forall a b z. (a -> b -> z) -> Data.Tuple.Tuple a b -> z
module Data.Monoid.First where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Monoid ()
newtype First (a :: *) = First (Data.Maybe.Maybe a)
foreign import runFirst :: forall a. Data.Monoid.First.First a -> Data.Maybe.Maybe a
foreign import instance eqFirst :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.First.First a)
foreign import instance ordFirst :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.First.First a)
foreign import instance showFirst :: (Prelude.Show a) => Prelude.Show (Data.Monoid.First.First a)
foreign import instance semigroupFirst :: Prelude.Semigroup (Data.Monoid.First.First a)
foreign import instance monoidFirst :: Data.Monoid.Monoid (Data.Monoid.First.First a)
module Data.Foldable where
import Data.Foldable ()
import Data.Monoid ()
import Prelude ()
import Control.Apply ()
import Data.Monoid.First ()
import Prim ()
import Prelude ()
import Control.Apply ()
import Data.Either ()
import Data.Eq ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Monoid.First ()
import Data.Tuple ()
class Foldable f where
  foldr :: forall a b. (a -> b -> b) -> b -> f a -> b
  foldl :: forall a b. (b -> a -> b) -> b -> f a -> b
  foldMap :: forall a m. (Data.Monoid.Monoid m) => (a -> m) -> f a -> m
foreign import foldlArray :: forall a b. (b -> a -> b) -> b -> [a] -> b
foreign import foldrArray :: forall a b. (a -> b -> b) -> b -> [a] -> b
foreign import lookup :: forall a b f. (Prelude.Eq a, Data.Foldable.Foldable f) => a -> f (Data.Tuple.Tuple a b) -> Data.Maybe.Maybe b
foreign import find :: forall a f. (Data.Foldable.Foldable f) => (a -> Prim.Boolean) -> f a -> Data.Maybe.Maybe a
foreign import notElem :: forall a f. (Prelude.Eq a, Data.Foldable.Foldable f) => a -> f a -> Prim.Boolean
foreign import elem :: forall a f. (Prelude.Eq a, Data.Foldable.Foldable f) => a -> f a -> Prim.Boolean
foreign import product :: forall f. (Data.Foldable.Foldable f) => f Prim.Number -> Prim.Number
foreign import sum :: forall f. (Data.Foldable.Foldable f) => f Prim.Number -> Prim.Number
foreign import all :: forall a f. (Data.Foldable.Foldable f) => (a -> Prim.Boolean) -> f a -> Prim.Boolean
foreign import any :: forall a f. (Data.Foldable.Foldable f) => (a -> Prim.Boolean) -> f a -> Prim.Boolean
foreign import or :: forall f. (Data.Foldable.Foldable f) => f Prim.Boolean -> Prim.Boolean
foreign import and :: forall f. (Data.Foldable.Foldable f) => f Prim.Boolean -> Prim.Boolean
foreign import intercalate :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => m -> f m -> m
foreign import mconcat :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => f m -> m
foreign import sequence_ :: forall a f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => f (m a) -> m Prelude.Unit
foreign import for_ :: forall a b f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => f a -> (a -> m b) -> m Prelude.Unit
foreign import traverse_ :: forall a b f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => (a -> m b) -> f a -> m Prelude.Unit
foreign import fold :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => f m -> m
foreign import instance foldableArray :: Data.Foldable.Foldable Prim.Array
foreign import instance foldableEither :: Data.Foldable.Foldable (Data.Either.Either a)
foreign import instance foldableMaybe :: Data.Foldable.Foldable Data.Maybe.Maybe
foreign import instance foldableRef :: Data.Foldable.Foldable Data.Eq.Ref
foreign import instance foldableTuple :: Data.Foldable.Foldable (Data.Tuple.Tuple a)
module Data.Monoid.Last where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Monoid ()
newtype Last (a :: *) = Last (Data.Maybe.Maybe a)
foreign import runLast :: forall a. Data.Monoid.Last.Last a -> Data.Maybe.Maybe a
foreign import instance eqLast :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Last.Last a)
foreign import instance ordLast :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Last.Last a)
foreign import instance showLast :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Last.Last a)
foreign import instance semigroupLast :: Prelude.Semigroup (Data.Monoid.Last.Last a)
foreign import instance monoidLast :: Data.Monoid.Monoid (Data.Monoid.Last.Last a)
module Data.String where
import Data.Function ()
import Data.String ()
import Data.Char ()
import Data.String.Unsafe ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Char ()
import Data.Function ()
import Data.String.Unsafe ()
foreign import joinWith :: Prim.String -> [Prim.String] -> Prim.String
foreign import trim :: Prim.String -> Prim.String
foreign import toUpper :: Prim.String -> Prim.String
foreign import toLower :: Prim.String -> Prim.String
foreign import toCharArray :: Prim.String -> [Data.Char.Char]
foreign import split :: Prim.String -> Prim.String -> [Prim.String]
foreign import dropWhile :: (Data.Char.Char -> Prim.Boolean) -> Prim.String -> Prim.String
foreign import drop :: Prim.Number -> Prim.String -> Prim.String
foreign import takeWhile :: (Data.Char.Char -> Prim.Boolean) -> Prim.String -> Prim.String
foreign import take :: Prim.Number -> Prim.String -> Prim.String
foreign import count :: (Data.Char.Char -> Prim.Boolean) -> Prim.String -> Prim.Number
foreign import replace :: Prim.String -> Prim.String -> Prim.String -> Prim.String
foreign import localeCompare :: Prim.String -> Prim.String -> Prim.Number
foreign import singleton :: Data.Char.Char -> Prim.String
foreign import length :: Prim.String -> Prim.Number
foreign import uncons :: Prim.String -> Data.Maybe.Maybe { tail :: Prim.String, head :: Data.Char.Char }
foreign import null :: Prim.String -> Prim.Boolean
foreign import lastIndexOf' :: Prim.String -> Prim.Number -> Prim.String -> Prim.Number
foreign import lastIndexOf :: Prim.String -> Prim.String -> Prim.Number
foreign import indexOf' :: Prim.String -> Prim.Number -> Prim.String -> Prim.Number
foreign import indexOf :: Prim.String -> Prim.String -> Prim.Number
foreign import fromChar :: Data.Char.Char -> Prim.String
foreign import fromCharArray :: [Data.Char.Char] -> Prim.String
foreign import charCodeAt :: Prim.Number -> Prim.String -> Data.Maybe.Maybe Prim.Number
foreign import charAt :: Prim.Number -> Prim.String -> Data.Maybe.Maybe Data.Char.Char
module Data.String.Regex where
import Data.String.Regex ()
import Data.String ()
import Data.Function ()
import Prim ()
import Prelude ()
import Data.Function ()
import Data.Maybe ()
import Data.String ()
type RegexFlags = { unicode :: Prim.Boolean, sticky :: Prim.Boolean, multiline :: Prim.Boolean, ignoreCase :: Prim.Boolean, global :: Prim.Boolean }
foreign import data Regex :: *
foreign import split :: Data.String.Regex.Regex -> Prim.String -> [Prim.String]
foreign import search :: Data.String.Regex.Regex -> Prim.String -> Prim.Number
foreign import replace' :: Data.String.Regex.Regex -> (Prim.String -> [Prim.String] -> Prim.String) -> Prim.String -> Prim.String
foreign import replace :: Data.String.Regex.Regex -> Prim.String -> Prim.String -> Prim.String
foreign import match :: Data.String.Regex.Regex -> Prim.String -> Data.Maybe.Maybe [Prim.String]
foreign import test :: Data.String.Regex.Regex -> Prim.String -> Prim.Boolean
foreign import parseFlags :: Prim.String -> Data.String.Regex.RegexFlags
foreign import renderFlags :: Data.String.Regex.RegexFlags -> Prim.String
foreign import flags :: Data.String.Regex.Regex -> Data.String.Regex.RegexFlags
foreign import source :: Data.String.Regex.Regex -> Prim.String
foreign import regex :: Prim.String -> Data.String.Regex.RegexFlags -> Data.String.Regex.Regex
foreign import instance showRegex :: Prelude.Show Data.String.Regex.Regex
module Data.Traversable where
import Prelude ()
import Data.Traversable ()
import Data.Array ()
import Prim ()
import Prelude ()
import Data.Array ()
import Data.Either ()
import Data.Eq ()
import Data.Foldable ()
import Data.Maybe ()
import Data.Tuple ()
class (Prelude.Functor t, Data.Foldable.Foldable t) <= Traversable t where
  traverse :: forall a b m. (Prelude.Applicative m) => (a -> m b) -> t a -> m (t b)
  sequence :: forall a m. (Prelude.Applicative m) => t (m a) -> m (t a)
foreign import mapAccumR :: forall a b s f. (Data.Traversable.Traversable f) => (s -> a -> Data.Tuple.Tuple s b) -> s -> f a -> Data.Tuple.Tuple s (f b)
foreign import mapAccumL :: forall a b s f. (Data.Traversable.Traversable f) => (s -> a -> Data.Tuple.Tuple s b) -> s -> f a -> Data.Tuple.Tuple s (f b)
foreign import zipWithA :: forall m a b c. (Prelude.Applicative m) => (a -> b -> m c) -> [a] -> [b] -> m [c]
foreign import for :: forall a b m t. (Prelude.Applicative m, Data.Traversable.Traversable t) => t a -> (a -> m b) -> m (t b)
foreign import instance traversableArray :: Data.Traversable.Traversable Prim.Array
foreign import instance traversableEither :: Data.Traversable.Traversable (Data.Either.Either a)
foreign import instance traversableRef :: Data.Traversable.Traversable Data.Eq.Ref
foreign import instance traversableMaybe :: Data.Traversable.Traversable Data.Maybe.Maybe
foreign import instance traversableTuple :: Data.Traversable.Traversable (Data.Tuple.Tuple a)
module Data.Foreign.Class where
import Prelude ()
import Data.Foreign ()
import Data.Traversable ()
import Data.Array ()
import Data.Foreign.Class ()
import Data.Foreign.Null ()
import Data.Foreign.Undefined ()
import Data.Foreign.NullOrUndefined ()
import Data.Either ()
import Data.Foreign.Index ()
import Prim ()
import Prelude ()
import Data.Array ()
import Data.Foreign ()
import Data.Foreign.Index ()
import Data.Foreign.Null ()
import Data.Foreign.Undefined ()
import Data.Foreign.NullOrUndefined ()
import Data.Traversable ()
import Data.Either ()
class IsForeign a where
  read :: Data.Foreign.Foreign -> Data.Foreign.F a
foreign import readProp :: forall a i. (Data.Foreign.Class.IsForeign a, Data.Foreign.Index.Index i) => i -> Data.Foreign.Foreign -> Data.Foreign.F a
foreign import readWith :: forall a e. (Data.Foreign.Class.IsForeign a) => (Data.Foreign.ForeignError -> e) -> Data.Foreign.Foreign -> Data.Either.Either e a
foreign import readJSON :: forall a. (Data.Foreign.Class.IsForeign a) => Prim.String -> Data.Foreign.F a
foreign import instance foreignIsForeign :: Data.Foreign.Class.IsForeign Data.Foreign.Foreign
foreign import instance stringIsForeign :: Data.Foreign.Class.IsForeign Prim.String
foreign import instance booleanIsForeign :: Data.Foreign.Class.IsForeign Prim.Boolean
foreign import instance numberIsForeign :: Data.Foreign.Class.IsForeign Prim.Number
foreign import instance arrayIsForeign :: (Data.Foreign.Class.IsForeign a) => Data.Foreign.Class.IsForeign [a]
foreign import instance nullIsForeign :: (Data.Foreign.Class.IsForeign a) => Data.Foreign.Class.IsForeign (Data.Foreign.Null.Null a)
foreign import instance undefinedIsForeign :: (Data.Foreign.Class.IsForeign a) => Data.Foreign.Class.IsForeign (Data.Foreign.Undefined.Undefined a)
foreign import instance nullOrUndefinedIsForeign :: (Data.Foreign.Class.IsForeign a) => Data.Foreign.Class.IsForeign (Data.Foreign.NullOrUndefined.NullOrUndefined a)