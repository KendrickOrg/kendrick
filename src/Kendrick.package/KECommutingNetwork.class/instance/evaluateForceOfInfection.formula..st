as yet unclassified
evaluateForceOfInfection: model formula: formula
	|s effectiveLambda localNode|
	s := model atParameter: #inProcessingCompartment.
	localNode := self atNode: (s at: self attribute).
	effectiveLambda := self evaluateForceOfInfection: model formula: formula onSubpopulation: localNode label.
	localNode adjacentNodes keysDo: [ :k|
		|travelRate ed|
		ed := (localNode label)->k.
		travelRate := (leaveRates at: ed)/(returnRates at: ed).
		effectiveLambda := effectiveLambda + (self evaluateForceOfInfection: model formula: formula onSubpopulation: k)
		].
	effectiveLambda := effectiveLambda / (1 + (self commutingRateOf: localNode)).
	^ effectiveLambda 