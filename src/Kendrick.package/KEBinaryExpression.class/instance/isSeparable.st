testing
isSeparable
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	tmp2 := leftHandSide isSeparable.
	tmp3 := rightHandSide isSeparable.
	tmp1 := false.
	op = #*
		ifTrue: [ tmp4 := false.
			tmp5 := false.
			tmp6 := [ :arg1 | arg1 isBinaryExpression and: [ arg1 op = #+ ] ].
			leftHandSide isUnaryExpression
				ifTrue: [ tmp4 := tmp6 value: leftHandSide expression ].
			rightHandSide isUnaryExpression
				ifTrue: [ tmp5 := tmp6 value: rightHandSide expression ].
			tmp1 := (tmp6 value: leftHandSide) | (tmp6 value: rightHandSide)
				| tmp4 | tmp5 ].
	^ tmp1 | tmp2 | tmp3