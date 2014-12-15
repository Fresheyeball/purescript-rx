module Rx.Concurrency.Scheduler.Test where

import Rx.Concurrency.Scheduler

import Test.Mocha
import Test.Chai(expect, toEqual, Chai())
import Data.Date(toEpochMilliseconds, now)
import Control.Monad.Eff
import Control.Monad.Eff.Ref

nowTime = now >>= return <<< toEpochMilliseconds

isEq :: forall a e. (Eq a) => a -> a -> Eff (chai :: Chai | e) Unit
isEq x y = expect (x == y) `toEqual` true

foreign import newTestScheduler """
  var MyScheduler = (function () {

    function defaultNow() {
        return new Date().getTime();
    }

    function schedule(state, action) {
        return action(this, state);
    }

    function scheduleRelative(state, dueTime, action) {
        var self = this;
        this.check(function (o) {
            return action(self, o);
        }, state, dueTime);
        this.waitCycles += dueTime;
        return action(this, state);
    }

    function scheduleAbsolute(state, dueTime, action) {
        return this.scheduleWithRelativeAndState(state, dueTime - this.now(), action);
    }

    return function (now) {
        var nowFunc = now ? defaultNow : function () { return now; };
        var scheduler = new Rx.Scheduler(nowFunc, schedule, scheduleRelative, scheduleAbsolute);
        scheduler.waitCycles = 0;

        return scheduler;
    };
  }());
  function newTestScheduler(now){
    return function(){
      return new MyScheduler(now);
    };
  }
  """ :: forall e. Number -> Eff (schedule :: Schedule | e) Scheduler

init = describe "Scheduler" do 
  it "ScheduleNonRecursive" do
    res <- newRef false
    newTestScheduler 0 >>= scheduleRecursive (const $ writeRef res true)
    readRef res >>= isEq true
