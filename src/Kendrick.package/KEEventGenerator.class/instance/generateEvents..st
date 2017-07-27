as yet unclassified
generateEvents: arg1
	| tmp2 |
	tmp2 := OrderedCollection new.
	arg1 equations
		do: [ :arg2 | 
			| tmp3 |
			tmp3 := arg2 generateEvents.
			tmp3
				do: [ :arg3 | 
					| tmp4 |
					(arg3 hasAnEventWithOppositeRateIn: tmp2)
						ifTrue: [ tmp4 := arg3 findEventWithOppositeRateIn: tmp2.
							tmp4 actions addAll: arg3 actions.
							tmp4 mapStatusWith: arg3 ]
						ifFalse: [ tmp2 add: arg3 ] ] ].
	tmp2 := self mergeEventsWithSameActionsIn: tmp2.
	^ tmp2