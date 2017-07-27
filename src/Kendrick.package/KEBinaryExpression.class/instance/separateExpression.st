as yet unclassified
separateExpression
	| tmp1 tmp2 |
	tmp1 := OrderedCollection new.
	leftHandSide isSeparable
		ifTrue: [ tmp2 := OrderedCollection new.
			tmp1 := leftHandSide doSeparation.
			tmp1
				do: [ :arg1 | 
					| tmp3 tmp5 |
					tmp5 := KEBinaryExpression new.
					tmp5
						op: op;
						leftHandSide: arg1.
					tmp3 := tmp5 rightHandSide: rightHandSide.
					tmp3 isSeparable
						ifTrue: [ tmp2 addAll: tmp3 doSeparation ]
						ifFalse: [ tmp2 add: tmp3 ] ].
			^ tmp2 ].
	rightHandSide isSeparable
		ifTrue: [ tmp2 := OrderedCollection new.
			tmp1 := rightHandSide doSeparation.
			tmp1
				do: [ :arg2 | 
					| tmp6 tmp8 |
					tmp8 := KEBinaryExpression new.
					tmp8
						op: op;
						leftHandSide: leftHandSide.
					tmp6 := tmp8 rightHandSide: arg2.
					tmp6 isSeparable
						ifTrue: [ tmp2 addAll: tmp6 doSeparation ]
						ifFalse: [ tmp2 add: tmp6 ] ].
			^ tmp2 ].
	tmp1 := self doSeparation.
	^ tmp1