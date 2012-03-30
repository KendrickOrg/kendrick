
!KEBinaryExpression methodsFor: 'as yet unclassified'!
events
|list |
list := Bag new.
(op symbol value = '*')|(op symbol value = '/')|(op symbol value = '^') ifTrue:[
	|e|
	e := KEEvent new.
	e rate: self.
	list add:e].

(op symbol value = '+')
ifTrue:[
	|l1 l2|
l1 := leftHandSide events.	
l2 := rightHandSide events.
list addAll:l1.
list addAll:l2.
].

(op symbol value = '-')
ifTrue:[
	|l1 l2 o|
	l1 := leftHandSide events.
	o := (KEOperator new) symbol: (PPToken on:#-).
	l2 := ((KEUnaryExpression new) op: o; expression: rightHandSide) events.
	list addAll:l1.
	list addAll:l2.
	].
^list! !
