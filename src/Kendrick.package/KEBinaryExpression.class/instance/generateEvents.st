as yet unclassified
generateEvents
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := OrderedCollection new.
	op = #* | (op = #/) | (op = #'^')
		ifTrue: [ self isSeparable
				ifTrue: [ tmp2 := self separateExpression.
					tmp2
						do: [ :arg1 | 
							| tmp6 |
							tmp6 := KEEvent new.
							tmp6 rate: arg1 normalize.
							tmp1 add: tmp6 ] ]
				ifFalse: [ tmp3 := KEEvent new rate: self normalize.
					tmp1 add: tmp3 ] ].
	op = #+
		ifTrue: [ tmp4 := leftHandSide generateEvents.
			tmp5 := rightHandSide generateEvents.
			tmp1
				addAll: tmp4;
				addAll: tmp5 ].
	op = #-
		ifTrue: [ | tmp8 |
			tmp4 := leftHandSide generateEvents.
			tmp8 := KEUnaryExpression new.
			tmp8 op: #-.
			tmp5 := (tmp8 expression: rightHandSide) generateEvents.
			tmp4 ifNotNil: [ tmp1 addAll: tmp4 ].
			tmp1 addAll: tmp5 ].
	^ tmp1