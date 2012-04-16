as yet unclassified
from: ty0 to: t1 accuracy: eps
 "Integrating from t0, y0 to t1, y1 with accuracy"

 | ty1 ty2 h|
 ty1 := ty0.
 h := t1 - ty0 time.
 [
  self add: ty1.
  ty2 := self adapt: 2 * h to: eps from: ty1.
  h := (ty2 time) - (ty1 time).
  ty1 := ty2.
  (ty1 time) <= t1.  
 ] whileTrue.
 ty2 := self step: t1 - (ty1 time) from: ty1.
 self add: ty2.
 ^ ty2 space