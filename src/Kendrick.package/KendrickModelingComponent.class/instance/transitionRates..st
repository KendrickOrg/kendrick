public-api
transitionRates: anExpressionOrBlock
	"setting same rate for all transitions"
	backEndEntity transitions do: [ :tr| 
		tr probability: anExpressionOrBlock	
	]