DSL
returnRatesOfAllConnections: aSingleValue oneWay: flag
	self strengthOfAllConnections: aSingleValue oneWay: flag.
	"adding into the returnRates"
	self nodes do: [ :e| 
		e adjacentNodes keysAndValuesDo: [ :k :v| 
			|ed|
			ed := (e label)->k.
			returnRates at: ed put: v
		] 
	]