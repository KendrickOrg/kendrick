as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t |
	result := Array new:10000.
	eventList := self generateEvents.
	t := 0.
	i := 1.
	rand1 := Random new.
	rand2 := Random new.
	[t < tMax] whileTrue: [
		rTotal := self sumOfRate.
		deltaT := ((rand1 next) log) negated / rTotal.
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: self.
	result at:i put: (Array with:t with: (self numberOfIndividualsAtCompartment:#I )).
	i := i +1
			].
	result := result select:[:each | each ~= nil]

	
		