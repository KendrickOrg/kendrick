as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t  previousTime i|
	result := Array new:200000.
	eventList := self generateEvents.
	t := 0.
	i := 1.
	rand1 := Random new.
	rand2 := Random new.
	previousTime :=0.
	[t < tMax] whileTrue: [
		rTotal := self sumOfRate.
		deltaT := 0.
		(rTotal ~= 0) ifTrue:
		[deltaT := ((rand1 next) log) negated / rTotal].
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: self.
		t > (previousTime+(0.5/365)) ifTrue: [result at:i put: (Array with:t with: (self numberOfIndividualsAtCompartment:#I )).
			i := i +1.
			previousTime := t.
			].
			].
	result := result select:[:each | each ~= nil]

	
		