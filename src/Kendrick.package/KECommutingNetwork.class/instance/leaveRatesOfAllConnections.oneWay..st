DSL
leaveRatesOfAllConnections: aSingleValue oneWay: flag
	self strengthOfAllConnections: aSingleValue oneWay: flag.
	"adding into the leaveRates"
	self nodes do: [ :e| 
		e adjacentNodes keysAndValuesDo: [ :k :v| 
			|ed|
			ed := (e label)->k.
			leaveRates at: ed put: v
		] 
	]