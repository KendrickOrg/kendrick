as yet unclassified
IBMProbabilisticAlgorithm
	| nbStep count rand t nbEquations timeIndex nbCompartments nbSpecies listCompSym result |
	nbStep := (0 to: tMax by: step) size.
	nbEquations := model numberOfEquations.
	nbCompartments := model numberOfCompartments.
	nbSpecies := model numberOfSpecies.
	listCompSym := model getListCompartmentSymbol.
	result := Array new: nbCompartments.
	timeIndex := Array new: nbCompartments.
	1 to: nbEquations do: [:index| 
		result at: index put: (Array new: nbStep).
		1 to: nbStep do: [:id|(result at: index) at: id put: (Array new: nbSpecies)]].
	1 to: nbEquations do: [:index| timeIndex at: index put: (Array new: nbStep)].
	
	listCompSym := model getListCompartmentSymbol.
	listOfTransitions := self generateTransitionOfEvents.	
	self initializeListIndividuals.
	t := tMin.
	count := 1.
	[ t <= tMax ] whileTrue: [ 
		"Put in result"
		model equations do:[:eachEq|
			1 to: nbCompartments do:[:cID|
				(eachEq variable symbol) = (listCompSym at: cID) ifTrue: [
					((result at: cID) at: count) at: (eachEq eqIndex) put: (((model atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex)).
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
					rateValue := ((eachTransition evaluateWithModel: model) abs) / (((model atCompartment: current) numberOfIndividuals) at: (eachTransition eqIndex)).
					eachTransition prob: (1 - ((step*rateValue*(-1)) exp)).	
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
		t := t + step.
	 ].
	data := Dictionary new.
	1 to: nbCompartments do: [:cID|
		|series|
		series := KESeries from: (result at: cID) withIndex: (timeIndex at: cID).
		data at: (listCompSym at: cID) put: series.
		].	
	^ data

	