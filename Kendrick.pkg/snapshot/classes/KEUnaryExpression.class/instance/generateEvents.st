
!KEUnaryExpression methodsFor: 'as yet unclassified'!
generateEvents

|list e|
list := Bag new.
e := KEEvent new.
e rate: self normalize.
list add:e.
^list! !
