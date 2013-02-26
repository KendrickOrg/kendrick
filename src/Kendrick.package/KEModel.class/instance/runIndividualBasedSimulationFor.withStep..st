as yet unclassified
runIndividualBasedSimulationFor: tMax withStep: dT
	| nbStep count listOfProbabilities rand listOfTransitions t nbEquations timeIndex k results |
	
	"Initializing"
	nbStep := (0 to: tMax by: dT) size.
	nbEquations := (self equations) size.
	data := Array new: nbEquations.
	timeIndex := Array new:nbEquations.
	1 to: nbEquations do: [:index| data at: index put: (Array new: nbStep)].
	1 to: nbEquations do: [:index| timeIndex at: index put: (Array new: nbStep)].
		
	"Finding transition of each event in eventList. If event has no transition, toStatus: nil"
	listOfTransitions := self generateTransitionOfEvents.	
		
	"Initializing a list of individuals in the population" 
	self initializeListIndividuals.	
		
	t := 0.
	count := 1.
	[t <= tMax] whileTrue: [
		"Put in result"
		k := 1.
		self equations do:[:eachEq|
			(data at: k) at: count put: (self numberOfIndividualsAtCompartment: (eachEq variable symbol)).
			(timeIndex at:k) at:count put:t.
			k := k+1.
			].
		"Calculate the state of all individuals in the list"
		listOfIndividuals do: [:each|
			|current transitions rateValue|
			current := each currentStatus.
			"transitions := (listOfTransitions select: [:tr|tr fromStatus = current])."
			transitions := self selectTransitionIn: listOfTransitions  have: current.
			transitions ifNotEmpty: [
				transitions do:[:eachTransition|
					rateValue := ((eachTransition evaluateWithModel: self) abs) / ((self atCompartment: current) numberOfIndividuals).
					eachTransition prob: (1 - ((dT*rateValue*(-1)) exp)).	
					rand := Random new.	
					(eachTransition prob > (rand next)) ifTrue: [each nextStatus: (eachTransition toStatus)]
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
	k := 1.
	self equations do: [:each|
		|series|
		series := KESeries from: (data at:k) withIndex: (timeIndex at:k).
		results at: (each variable symbol) put: series.
		k := k+1
		].
	^results
	

	
		