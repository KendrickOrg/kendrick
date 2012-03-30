
!KEBinaryExpression methodsFor: 'as yet unclassified'!
events
|list |
list := Bag new.
(op = #*)|(op  = #/)|(op   = #^) ifTrue:[
	|e|
	e := KEEvent new.
	e rate: self.
	list add:e].

(op   = #+)
ifTrue:[
	|l1 l2|
l1 := leftHandSide events.	
l2 := rightHandSide events.
list addAll:l1.
list addAll:l2.
].

(op   = #-)
ifTrue:[
	|l1 l2 o|
	l1 := leftHandSide events.
	l2 := ((KEUnaryExpression new) op: #-; expression: rightHandSide) events.
	list addAll:l1.
	list addAll:l2.
	].
^list! !
