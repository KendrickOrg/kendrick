public-api
transitionRates: arg1
	backEndEntity transitions do: [ :arg2 | arg2 probability: arg1 ]