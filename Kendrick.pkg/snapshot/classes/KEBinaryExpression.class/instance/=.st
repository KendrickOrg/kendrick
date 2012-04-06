
!KEBinaryExpression methodsFor: 'as yet unclassified'!
= aBinaryExpression

| self_left self_right left right t1 t2 |
self_left := self leftHandSide.
self_right := self rightHandSide.
left  := aBinaryExpression leftHandSide.
right := aBinaryExpression rightHandSide.
(self op = aBinaryExpression op) ifTrue:[
	t1 := self_left = left.
	t2 := self_right = right. 
	(t1 = true)
	]
ifFalse: [^false].
^true! !
