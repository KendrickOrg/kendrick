public-api
dataWithSimpleCompartments: anArray "should be full math-expression"

		^ diag data: 
			(simulation 
					timeSeriesOutputsAt: 
						(simulation model transitionRefFor: anArray first))

					
			