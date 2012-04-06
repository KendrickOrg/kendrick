as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t |
	eventList := self generateEvents.
	t := 0.
	rand1 := Random new.
	rand2 := Random new.
	[t < tMax] whileTrue: [
		rTotal := self sumOfRate.
		deltaT := ((rand1 next) log) negated / rTotal.
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		selectedEvent ifNil:[self halt].
		t := t + deltaT.
		selectedEvent executeOn: self.
		]

	
		