
!KEUnaryExpression methodsFor: 'as yet unclassified'!
events
|list e|
list := Bag new.
e := KEEvent new.
e rate: self.
list add:e.
^list! !
