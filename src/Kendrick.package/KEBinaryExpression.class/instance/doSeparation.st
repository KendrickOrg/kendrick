as yet unclassified
doSeparation
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 |
	tmp1 := OrderedCollection new.
	tmp4 := false.
	tmp5 := false.
	tmp2 := leftHandSide.
	leftHandSide isUnaryExpression
		ifTrue: [ tmp2 := leftHandSide expression ].
	tmp3 := rightHandSide.
	rightHandSide isUnaryExpression
		ifTrue: [ tmp3 := rightHandSide expression ].
	tmp2 isBinaryExpression
		ifTrue: [ tmp4 := tmp2 op = #+ | (tmp2 op = #-) ].
	tmp3 isBinaryExpression
		ifTrue: [ tmp5 := tmp3 op = #+ | (tmp3 op = #-) ].
	tmp2 isBinaryExpression & tmp4
		ifTrue: [ | tmp10 tmp12 |
			tmp10 := KEBinaryExpression new.
			tmp10
				op: op;
				leftHandSide: tmp2 leftHandSide.
			tmp6 := tmp10 rightHandSide: tmp3.
			tmp12 := KEBinaryExpression new.
			tmp12 op: op.
			tmp7 := tmp12 rightHandSide: tmp3.
			tmp2 op = #-
				ifTrue: [ | tmp14 |
					tmp14 := KEUnaryExpression new.
					tmp14 op: #-.
					tmp7 leftHandSide: (tmp14 expression: tmp2 rightHandSide) ]
				ifFalse: [ tmp7 leftHandSide: tmp2 rightHandSide ].
			tmp6 isSeparable
				ifTrue: [ tmp1 addAll: tmp6 doSeparation ]
				ifFalse: [ tmp1 add: tmp6 ].
			tmp7 isSeparable
				ifTrue: [ tmp1 addAll: tmp7 doSeparation ]
				ifFalse: [ tmp1 add: tmp7 ] ]
		ifFalse: [ tmp3 isBinaryExpression & tmp5
				ifTrue: [ | tmp16 tmp18 |
					tmp16 := KEBinaryExpression new.
					tmp16
						op: op;
						leftHandSide: tmp2.
					tmp6 := tmp16 rightHandSide: tmp3 leftHandSide.
					tmp18 := KEBinaryExpression new.
					tmp18 op: op.
					tmp7 := tmp18 leftHandSide: tmp2.
					tmp3 op = #-
						ifTrue: [ | tmp20 |
							tmp20 := KEUnaryExpression new.
							tmp20 op: #-.
							tmp7 rightHandSide: (tmp20 expression: tmp3 rightHandSide) ]
						ifFalse: [ tmp7 rightHandSide: tmp3 rightHandSide ].
					tmp6 isSeparable
						ifTrue: [ tmp1 addAll: tmp6 doSeparation ]
						ifFalse: [ tmp1 add: tmp6 ].
					tmp7 isSeparable
						ifTrue: [ tmp1 addAll: tmp7 doSeparation ]
						ifFalse: [ tmp1 add: tmp7 ] ]
				ifFalse: [ | tmp22 |
					tmp22 := KEBinaryExpression new.
					tmp22
						op: op;
						leftHandSide: tmp2.
					tmp1 add: (tmp22 rightHandSide: tmp3) ] ].
	leftHandSide isUnaryExpression & rightHandSide isUnaryExpression
		ifTrue: [ ^ tmp1 ].
	leftHandSide isUnaryExpression | rightHandSide isUnaryExpression
		ifTrue: [ tmp8 := OrderedCollection new.
			tmp1
				do: [ :arg1 | 
					| tmp24 |
					tmp24 := KEUnaryExpression new.
					tmp24 op: #-.
					tmp8 add: (tmp24 expression: arg1) ].
			^ tmp8 ].
	^ tmp1