
!RungeKutta methodsFor: 'as yet unclassified'!
from: ty0 to: t1 steps: n
 "Integrating from t0, y0 to t1, y1 using n steps"

 | ty h |
 ty := ty0.
 self add: ty.
 h := (t1 - ty0 time) / n.
 n timesRepeat: [
  ty := self step: h from: ty.
  self add: ty.
 ].
 ^ ty space! !
