
!KEBinaryExpression methodsFor: 'as yet unclassified'!
events
|list |
list := Bag new.
(op value = '*')|(op value = '/')|(op value = '^') ifTrue:[
	|e|
	e := KEEvent new.
	e rate: self.
	list add:e].

(op value = '+')|(op value = '-')
ifTrue:[
	|l1 l2|
l1 := leftHandSide events.	
l2 := rightHandSide events.
list addAll:l1.
list addAll:l2.
].
^list! !
