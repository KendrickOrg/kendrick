as yet unclassified
transitionRates: anExpressionOrBlock
	"setting same rate for all transitions"
	self transitions do: [ :tr| 
		tr probability: anExpressionOrBlock	
	]