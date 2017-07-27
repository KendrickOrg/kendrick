converting
normalize
	| tmp1 tmp2 tmp3 |
	tmp1 := leftHandSide normalize.
	tmp2 := rightHandSide normalize.
	tmp3 := KEUnaryExpression new.
	tmp3 op: #-.
	tmp1 isUnaryExpression
		ifTrue: [ | tmp5 |
			tmp2 isUnaryExpression
				ifTrue: [ self
						leftHandSide: tmp1 expression;
						rightHandSide: tmp2 expression.
					^ self ].
			tmp5 := KEBinaryExpression new.
			tmp5
				op: self op;
				leftHandSide: tmp1 expression.
			tmp3 expression: (tmp5 rightHandSide: tmp2).
			^ tmp3 ].
	tmp2 isUnaryExpression
		ifTrue: [ | tmp7 |
			tmp7 := KEBinaryExpression new.
			tmp7
				op: self op;
				leftHandSide: tmp1.
			tmp3 expression: (tmp7 rightHandSide: tmp2 expression).
			^ tmp3 ]