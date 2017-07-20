public-api
dataWithSimpleCompartments: anArray "should be full math-expression"

		^ diag data: 
			(simulation 
					allTimesSeriesContaining: 
						(simulation model transitionRefFor: anArray first))

					
			