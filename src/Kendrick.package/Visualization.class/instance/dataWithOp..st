public-api
dataWithOp: anArray "should be full math-expression"
	^ lazyDataBlock := [
			diag data: 
				((simulation 
					timeSeriesAt: 
						(simulation model transitionRefFor: anArray first))
					perform: anArray last)
			]