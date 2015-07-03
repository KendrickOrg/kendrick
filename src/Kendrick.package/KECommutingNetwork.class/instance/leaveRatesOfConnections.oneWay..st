DSL
leaveRatesOfConnections: anArrayOfValues oneWay: flag
	self strengthOfConnections: anArrayOfValues oneWay: flag.
	"adding into the leaveRates"
	self nodes do: [ :e| 
		e adjacentNodes keysAndValuesDo: [ :k :v| 
			|ed|
			ed := (e label)->k.
			leaveRates at: ed put: v
		] 
	]