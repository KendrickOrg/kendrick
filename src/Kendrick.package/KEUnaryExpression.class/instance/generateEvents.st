as yet unclassified
generateEvents
	| tmp1 tmp2 tmp3 |
	expression isUnaryExpression | expression isBinaryExpression
		ifTrue: [ tmp3 := OrderedCollection new.
			tmp1 := expression generateEvents.
			tmp1
				do: [ :arg1 | 
					| tmp4 tmp6 |
					tmp4 := arg1 rate.
					tmp6 := KEUnaryExpression new.
					tmp6 op: #-.
					arg1 rate: (tmp6 expression: tmp4) normalize.
					tmp3 add: arg1 ].
			^ tmp3 ].
	tmp2 := KEEvent new.
	tmp2 rate: self normalize.
	tmp1 add: tmp2.
	^ tmp1