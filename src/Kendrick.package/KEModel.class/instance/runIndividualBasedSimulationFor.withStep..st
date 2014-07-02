as yet unclassified
runIndividualBasedSimulationFor: tMax withStep: dT
	| nbStep count listOfProbabilities rand listOfTransitions t nbEquations timeIndex k results nbCompartments nbSpecies listCompSym |
	
	"Initializing"
	nbStep := (0 to: tMax by: dT) size.
	nbEquations := (self equations) size.
	nbCompartments := compartments size.
	nbSpecies := self numberOfSpecies.
	listCompSym := self getListCompartmentSymbol.
	data := Array new: nbCompartments.
	timeIndex := Array new: nbCompartments.
	1 to: nbEquations do: [:index| 
		data at: index put: (Array new: nbStep).
		1 to: nbStep do: [:id|(data at: index) at: id put: (Array new: nbSpecies)]].
	1 to: nbEquations do: [:index| timeIndex at: index put: (Array new: nbStep)].
		
	"Finding transition of each event in eventList. If event has no transition, toStatus: nil"
	listOfTransitions := self generateTransitionOfEvents.	
		
	"Initializing a list of individuals in the population" 
	self initializeListIndividuals.	
		
	t := 0.
	count := 1.
	[t <= tMax] whileTrue: [
		"Put in result"
		self equations do:[:eachEq|
			1 to: nbCompartments do:[:cID|
				(eachEq variable symbol) = (listCompSym at: cID) ifTrue: [
					((data at: cID) at: count) at: (eachEq eqIndex) put: (((self atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex)).
					(timeIndex at: cID) at: count put: t.
					]
				].			
			].
		"Calculate the state of all individuals in the list"
		listOfIndividuals do: [:each|
			|current transitions rateValue|
			current := each currentStatus.
			transitions := self selectTransitionIn: listOfTransitions haveStatus: current withSpecieID: (each specieID).
			transitions ifNotEmpty: [
				transitions do:[:eachTransition|
					rateValue := ((eachTransition evaluateWithModel: self) abs) / (((self atCompartment: current) numberOfIndividuals) at: (eachTransition eqIndex)).
					eachTransition prob: (1 - ((dT*rateValue*(-1)) exp)).	
					rand := Random new.	
					(eachTransition prob > (rand next)) ifTrue: [each nextStatus: (eachTransition toStatus symbol)]
					]
				]			
			].
		"Update state for all individuals in the list"
		listOfIndividuals do: [:each|
			(each nextStatus) ifNotNil: [
				each currentStatus: (each nextStatus).
				each nextStatus: nil]
			].		
		"Update the number of Individuals for each classe"		
		self updateNbIndividualsForCompartments.	
		count := count + 1.
		t := t + dT.
		].		
	results := Dictionary new.
	1 to: nbCompartments do: [:cID|
		|series|
		series := KESeries from: (data at: cID) withIndex: (timeIndex at: cID).
		results at: (listCompSym at: cID) put: series.
		].	
	^results
	

	
		