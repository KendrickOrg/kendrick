as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t  previousTime i nbEquations k results nbSpecies nbCompartment listCompSym compartmentIndex |	
	
	nbEquations := self equations size.
	nbSpecies := self numberOfSpecies.
	nbCompartment := nbEquations / nbSpecies.
	listCompSym := self getListCompartmentSymbol.
	
	data := Array new: nbCompartment.
	compartmentIndex := Array new: nbCompartment.

	1 to: nbCompartment do:[:id1|
		data at: id1 put: (Array new: nbSpecies).
		1 to: nbSpecies do: [:id2|(data at: id1) at: id2 put: (Array new: 200000)]
		].
	1 to: nbCompartment do: [:index| compartmentIndex at:index put:(listCompSym at: index)].
	
	eventList := self generateEvents.
	
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
						((data at: cId) at: (eachEq eqIndex)) at: i put: (Array with: t with: (((self atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex))).
						]
					].				
				].			
			i := i +1.
			previousTime := t.
			].
			].	
	1 to: nbCompartment do: [:cID|			
		1 to: nbSpecies do: [:id|(data at: cID) at: id put: (((data at: cID) at: id) select: [:e| e ~= nil])].		
		].
	results := KESeries from: data withIndex: compartmentIndex.
	^results.
 