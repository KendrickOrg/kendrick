as yet unclassified
runIndividualBasedSimulationFor: tMax withStep: dT
	| nbStep count listOfProbabilities rand listOfTransitions t|
	
	"Initializing"
	nbStep := (0 to: tMax by: dT) size.
	result := Array new: nbStep.	
		
	"Finding transition of each event in eventList. If event has no transition, toStatus: nil"
	listOfTransitions := self generateTransitionOfEvents.	
		
	"Initializing a list of individuals in the population"
	self initializeListIndividuals.	
		
	t := 0.
	count := 1.
	[t <= tMax] whileTrue: [
		"Put in result"
		result at: count put: (Array with: t with: (self numberOfIndividualsAtCompartment: #I)).
		"Calculate the state of all individuals in the list"
		listOfIndividuals do: [:each|
			|current transition rateValue|
			current := each currentStatus.
			transition := (listOfTransitions select: [:tr|tr fromStatus = current]).
			transition ifNotEmpty: [
				transition := transition first.
				rateValue := ((transition evaluateWithModel: self) abs) / ((self atCompartment: current) numberOfIndividuals).		
			transition prob: (1 - ((dT*rateValue*(-1)) exp)).
			rand := Random new.	
			(transition prob > (rand next)) ifTrue: [each nextStatus: (transition toStatus)]
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
	self plot.
	

	
		