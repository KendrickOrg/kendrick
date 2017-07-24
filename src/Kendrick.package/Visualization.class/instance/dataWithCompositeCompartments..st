public-api
dataWithCompositeCompartments: anArray "should be full math-expression"
		
		| tokens tSeries |
		
		tSeries := OrderedCollection new.
		
		anArray do: [:name | 
				tokens := name findTokens: '_'.
					(simulation model allTransitionRefsForAttribute: tokens second) do: [:comp |  
						|compositeCompartment|
						compositeCompartment 
							:= (simulation model transitionRefFor: tokens first) allButLast.
						compositeCompartment := compositeCompartment , ' , ' , comp allButFirst.
						tSeries add: (self sumOverTimeSeries: compositeCompartment).			
					]	
				].

	^ diag data: tSeries.
					
			