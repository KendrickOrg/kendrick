as yet unclassified
= aBinaryExpression

| self_left self_right left right t1 t2 |
self_left := self leftHandSide.
self_right := self rightHandSide.
left  := aBinaryExpression leftHandSide.
right := aBinaryExpression rightHandSide.
(self op symbol value = aBinaryExpression op symbol value) ifTrue:[
	t1 := self_left compareWith: left.
	t2 := self_right compareWith: right. 
	(t1 = true)
	]
ifFalse: [^false]