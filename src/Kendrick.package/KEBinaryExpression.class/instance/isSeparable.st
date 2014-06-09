as yet unclassified
isSeparable
	|c c1 c2|
	c1 := leftHandSide isSeparable.
	c2 := rightHandSide isSeparable.
	c := false.
	(op = #*)|(op = #/) ifTrue: [
		|c3 c4 f|
		c3 := false.
		c4 := false.
		f := [ :x | (x isBinaryExpression) ifTrue: [((x op = #+)|(x op = #-))] ifFalse: [false] ].
		leftHandSide isUnaryExpression ifTrue: [c3 := (f value: (leftHandSide expression))].			
		rightHandSide isUnaryExpression ifTrue: [c4 := (f value: (rightHandSide expression))].
		c := (f value: leftHandSide)|(f value: rightHandSide)|c3|c4
		].
	^ c|c1|c2