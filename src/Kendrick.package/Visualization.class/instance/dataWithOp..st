public-api
dataWithOp: arg1
	^ lazyDataBlock := [ diag
		data:
			((simulation
				allTimesSeriesContaining: (simulation model transitionRefFor: arg1 first))
				perform: arg1 last) ]