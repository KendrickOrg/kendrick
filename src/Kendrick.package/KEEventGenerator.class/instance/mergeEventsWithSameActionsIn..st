as yet unclassified
mergeEventsWithSameActionsIn: arg1
	| tmp1 |
	tmp1 := OrderedCollection new.
	arg1
		do: [ :arg2 | 
			| tmp2 |
			(arg2 hasAnEventWithSameActionsIn: tmp1)
				ifTrue: [ | tmp4 |
					tmp2 := arg2 findEventWithSameActionsIn: tmp1.
					tmp4 := KEBinaryExpression new.
					tmp4
						op: #+;
						leftHandSide: tmp2 rate.
					tmp2 rate: (tmp4 rightHandSide: arg2 rate) ]
				ifFalse: [ tmp1 add: arg2 ] ].
	tmp1
		do: [ :arg3 | 
			arg3 fromStatus = #empty
				ifFalse: [ arg3
						rate: (arg3 rate remove: (KEVariable new symbol: arg3 fromStatus)) ] ].
	^ tmp1