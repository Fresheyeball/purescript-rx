module Rx.Observable where

import Prelude
import Control.Monad.Eff
import Data.Foreign.OOFFI
import DOM

foreign import data Observable :: * -> *

instance observableFunctor :: Functor Observable where
  (<$>) = map

instance applyObservable :: Apply Observable where
  (<*>) = combineLatest id

instance applicativeObservable :: Applicative Observable where
  pure = just

instance observableBind :: Bind Observable where
  (>>=) = fmap

instance monadObservable :: Monad Observable

instance semigroupObservable :: Semigroup (Observable a) where
  (<>) = concat


foreign import data RXObservable :: *
foreign import observable "var observable = Rx.Observable;" :: RXObservable

just :: forall a. a -> Observable a
just = method1 "just" observable

fromArray :: forall a. [a] -> Observable a
fromArray = method1 "fromArray" observable

empty :: forall a. Observable a
empty = method0 "empty" observable

foreign import subscribe """
  function subscribe(ob) {
    return function(f) {
      return function() {
        return ob.subscribe(function(value) {
          f(value)();
        });
      }
    };
  }
  """ :: forall eff a. Observable a -> (a -> Eff eff Unit) -> Eff eff Unit

merge :: forall a. Observable a -> Observable a -> Observable a
merge = method1 "merge"

foreign import combineLatest """
  function combineLatest(f) {
    return function(ob1) {
      return function(ob2) {
        return ob1.combineLatest(ob2, function (x, y) {
          return f(x)(y);
        });
      };
    };
  }
  """ :: forall a b c. (a -> b -> c) -> Observable a -> Observable b -> Observable c

concat :: forall a. Observable a -> Observable a -> Observable a
concat = method1 "concat"

take :: forall a. Number -> Observable a -> Observable a
take = flip $ method1 "take"

takeUntil :: forall a b. Observable b -> Observable a -> Observable a
takeUntil = flip $ method1 "takeUntil"

map :: forall a b. (a -> b) -> Observable a -> Observable b
map = flip $ method1 "map"

fmap :: forall a b. Observable a -> (a -> Observable b) -> Observable b
fmap = method1 "flatMap"

foreign import scan """
  function scan(ob) {
    return function(f) {
      return function(seed) {
        return ob.scan(seed, function(acc, value) {
          return f(value)(acc);
        });
      }
    };
  }
  """ :: forall a b. Observable a -> (a -> b -> b) -> b -> Observable b

foreign import unwrap """
  function unwrap(ob) {
    return function() {
      return ob.map(function(eff) {
        return eff();
      });
    };
  }
  """ :: forall eff a. Observable (Eff eff a) -> Eff eff (Observable a)

switchLatest :: forall a. Observable (Observable a) -> Observable a
switchLatest = method0 "switchLatest"

debounce :: forall a. Number -> Observable a -> Observable a
debounce = flip $ method1 "debounce"
