public-api
dataWithCompositeCompartments: arg1
	| tmp1 tmp3 |
	tmp1 := OrderedCollection new.
	arg1
		do: [ :arg2 | 
			tmp3 := arg2 findTokens: '_'.
			(simulation model allTransitionRefsForAttribute: tmp3 second)
				do: [ :arg3 | 
					| tmp4 |
					tmp4 := (simulation model transitionRefFor: tmp3 first)
						allButLast.
					tmp4 := tmp4 , ' , ' , arg3 allButFirst.
					tmp1 add: (self sumOverTimeSeries: tmp4) ] ].
	^ diag data: tmp1