public-api
dataWithOp: anArray "should be full math-expression"
	^ lazyDataBlock := [
			diag data: 
				((simulation 
					allTimesSeriesContaining: 
						(simulation model transitionRefFor: anArray first))
					perform: anArray last)
			]