
!Solution methodsFor: 'as yet unclassified'!
space: t
 "gets space at time"

 | i ty0 ty1|
 "i := self findFirst: [:arg | t <= arg time]."
 i := self findBinaryUpperBound: [:arg | t - arg time].
 ty1 := self at: i.
 [t <= ty1 time] assert.
 i > 1 ifTrue: [
  ty0 := self at: i - 1.
  [ty0 time <= t] assert.
  ^ ty0 space + ((ty1 space  - ty0 space) / (ty1 time  - ty0 time)  * (t - ty0 time))
 ] ifFalse: [
  ^ ty1 space 
 ]! !
