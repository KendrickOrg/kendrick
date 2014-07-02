as yet unclassified
doSeparation
	|list left right c1 c2|
	list := Bag new.
	c1 := false.
	c2 := false.
	left := leftHandSide.
	leftHandSide isUnaryExpression ifTrue: [left := (leftHandSide expression)].
	right := rightHandSide.
	rightHandSide isUnaryExpression ifTrue: [right := (rightHandSide expression)].
	left isBinaryExpression ifTrue: [c1 := (left op = #+)|(left op = #-)].
	right isBinaryExpression ifTrue: [c2 := (right op = #+)|(right op = #-)].
	(left isBinaryExpression)&c1 ifTrue: [
		|e1 e2|
		e1 := (KEBinaryExpression new) op: op; leftHandSide: (left leftHandSide); rightHandSide: right.
		e2 := (KEBinaryExpression new) op: op; rightHandSide: right.
		left op = #- ifTrue: [e2 leftHandSide: ((KEUnaryExpression new) op: #-; expression: (left rightHandSide))] ifFalse: [e2 leftHandSide: (left rightHandSide)].
		e1 isSeparable ifTrue: [list addAll: (e1 doSeparation)] ifFalse: [list add: e1].
		e2 isSeparable ifTrue: [list addAll: (e2 doSeparation)] ifFalse: [list add: e2].			
		]
	ifFalse: [
		(right isBinaryExpression)&c2 ifTrue: [
			|e1 e2|
			e1 := (KEBinaryExpression new) op: op; leftHandSide: left; rightHandSide: (right leftHandSide).
			e2 := (KEBinaryExpression new) op: op; leftHandSide: left. 
			right op = #- ifTrue: [e2 rightHandSide: ((KEUnaryExpression new) op: #-; expression: (right rightHandSide))] ifFalse: [e2 rightHandSide: (right rightHandSide)].
			e1 isSeparable ifTrue: [list addAll: (e1 doSeparation)] ifFalse: [list add: e1].
			e2 isSeparable ifTrue: [list addAll: (e2 doSeparation)] ifFalse: [list add: e2].
			]						
		ifFalse: [
			list add: ((KEBinaryExpression new) op: op; leftHandSide: left; rightHandSide: right).
			]
		].
	(leftHandSide isUnaryExpression)&(rightHandSide isUnaryExpression) ifTrue: [^ list] 
	ifFalse: [
		(leftHandSide isUnaryExpression)|(rightHandSide isUnaryExpression) ifTrue: [
			|l|
			l := Bag new.
			list do: [:each|l add: ((KEUnaryExpression new) op: #-; expression: each)].
			^ l
			]
		].
	^ list
	
	
	
	
	
	
	