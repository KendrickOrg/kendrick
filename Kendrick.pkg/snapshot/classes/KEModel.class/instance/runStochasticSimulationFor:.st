
!KEModel methodsFor: 'as yet unclassified'!
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t |
	eventList := self events.
	t := 0.
	[t < tMax] whileTrue: [
		rTotal := self sumOfRateWith.
		rand1 := Random new.
		deltaT := ((rand1 next) log) negated / rTotal.
		rand2 := Random new.
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: self.
		Transcript show: (self atCompartment: #I) numberOfIndividuals; cr.
		]

	
		! !
