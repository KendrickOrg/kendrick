public-api
dataWithSimpleCompartments: anArray "should be full math-expression"

		^ diag data: 
			(simulation 
					timeSeriesAt: 
						(simulation model transitionRefFor: anArray first))

					
			