as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t  previousTime i nbEquations k results nbSpecies nbCompartment listCompSym timeIndex |	
	
	nbEquations := self equations size.
	nbSpecies := self numberOfSpecies.
	nbCompartment := nbEquations / nbSpecies.
	listCompSym := self getListCompartmentSymbol.
	
	data := Array new: nbCompartment.
	timeIndex := Array new: nbCompartment.

	1 to: nbCompartment do:[:id1|
		data at: id1 put: (Array new: 200000).
		1 to: 200000 do: [:id2|(data at: id1) at: id2 put: (Array new: nbSpecies)]
		].
	1 to: nbCompartment do: [:index| timeIndex at:index put:(Array new: 200000)].
	
	self generateEvents.	
	t := 0.
	i := 1.
	rand1 := Random new.
	rand2 := Random new.
	previousTime :=0.
	[t < tMax] whileTrue: [
		self timeValue: t.
		rTotal := self sumOfRate.
		"self halt."
		deltaT := 0.
		(rTotal ~= 0) ifTrue:
		[deltaT := ((rand1 next) log) negated / rTotal].
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: self.
		t > (previousTime+(0.5/365)) ifTrue: [			
			self equations do: [:eachEq|
				1 to: nbCompartment  do: [:cId|
					(eachEq variable symbol) = (listCompSym at: cId) ifTrue: [
						((data at: cId) at:i) at: (eachEq eqIndex) put: (((self atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex)).
						(timeIndex at: cId) at:i put:t.
						]
					].				
				].			
			i := i +1.
			previousTime := t.
			].
			].
	results := Dictionary new.	
	1 to: nbCompartment do: [:cID|
		|series |
		series := KESeries from: (data at:cID) withIndex: ((timeIndex at: cID) select:[:e| e~= nil]).
		results at: (listCompSym at: cID) put: series.
		].
	^results.
 