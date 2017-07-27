public-api
transitionRates: arg1
	self transitions do: [ :arg2 | arg2 probability: arg1 ]