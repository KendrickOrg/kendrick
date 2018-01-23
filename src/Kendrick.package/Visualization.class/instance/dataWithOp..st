public-api
dataWithOp: anArray "should be full math-expression"
	^ lazyDataBlock := [
			diag data: 
				((simulation 
					timeSeriesOutputsAt: 
						(simulation model transitionRefFor: anArray first))
					perform: anArray last)
			]