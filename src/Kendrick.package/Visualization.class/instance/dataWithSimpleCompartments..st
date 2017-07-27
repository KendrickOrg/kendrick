public-api
dataWithSimpleCompartments: arg1
	^ diag
		data:
			(simulation
				allTimesSeriesContaining: (simulation model transitionRefFor: arg1 first))