DSL
returnRatesOfConnections: anArrayOfValues oneWay: flag
	self strengthOfConnections: anArrayOfValues oneWay: flag.
	"adding into the leaveRates"
	self nodes do: [ :e| 
		e adjacentNodes keysAndValuesDo: [ :k :v| 
			|ed|
			ed := (e label)->k.
			returnRates at: ed put: v
		] 
	]