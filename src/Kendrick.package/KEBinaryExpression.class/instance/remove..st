removing
remove: arg1
	| tmp1 tmp3 |
	tmp3 := KEBinaryExpression new.
	tmp3
		op: op;
		leftHandSide: (leftHandSide remove: arg1).
	tmp1 := tmp3 rightHandSide: (rightHandSide remove: arg1).
	tmp1 checkNil
		ifTrue: [ ^ nil ].
	tmp1 leftHandSide ifNil: [ ^ rightHandSide ].
	tmp1 rightHandSide ifNil: [ ^ leftHandSide ].
	tmp1 leftHandSide isUnaryExpression & tmp1 leftHandSide checkNil
		ifTrue: [ | tmp5 |
			tmp5 := KEUnaryExpression new.
			tmp5 op: #-.
			^ tmp5 expression: rightHandSide ].
	tmp1 rightHandSide isUnaryExpression & tmp1 rightHandSide checkNil
		ifTrue: [ | tmp7 |
			tmp7 := KEUnaryExpression new.
			tmp7 op: #-.
			^ tmp7 expression: leftHandSide ].
	^ tmp1