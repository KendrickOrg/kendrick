as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t  previousTime i nbEquations k results nbSpecies nbComp listCompSym |	
	"Number of equations"
	nbEquations := self equations size.
	"Number of host"
	nbSpecies := self numberOfSpecies.
	"Number of compartments "
	nbComp := nbEquations / nbSpecies.
	"List all symbols of compartments"
	listCompSym := self compartmentSymbols.
	
	result := Array new: nbComp.
	1 to: nbComp do:[:id1|
		result at: id1 put: (Array new: nbSpecies).
		1 to: nbSpecies do: [:id2|(result at: id1) at: id2 put: (Array new: 200000)]
		].	
	events := self generateEvents.
	"self halt."
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
		"self halt."
		t := t + deltaT.
		selectedEvent executeOn: self.
		t > (previousTime+(0.5/365)) ifTrue: [			
			self equations do: [:eachEq|
				1 to: nbComp do: [:cId|
					(eachEq variable symbol) = (listCompSym at: cId) ifTrue: [
						((result at: cId) at: (eachEq eqIndex)) at: i put: (Array with: t with: (((self atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex)))
						]
					].				
				].			
			i := i +1.
			previousTime := t.
			].
			].
	"self halt."
	results := KETimeSeriesCollection new.
	1 to: nbComp do: [:cID|
		1 to: nbSpecies do: [:id|(result at: cID) at: id put: (((result at: cID) at: id) select: [:e| e ~= nil])].
		results add: (listCompSym at: cID) value: (result at: cID)
		].
	"self halt."
	^results.
	"result := result select:[:each | each ~= nil]"

 