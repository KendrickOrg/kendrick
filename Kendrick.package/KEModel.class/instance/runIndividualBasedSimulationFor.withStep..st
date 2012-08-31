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
		"Calculate rate of each event in the eventList and transform it into probability"
		listOfTransitions do: [:each|
			|rateValue proba|
			rateValue := (each evaluateWithModel: self) abs.
			proba := 1 - ((dT*rateValue*(-1)) exp).			
			each prob: proba.
			].					
		"For each individual in the listOfIndividuals, calculate the nextStatus"
		listOfIndividuals do: [:each|			
			"For each event in the list of events"			
			1 to: (listOfTransitions size) do: [:id|
				(each currentStatus = (listOfTransitions at: id) fromStatus) ifTrue: [							
					rand := Random new.				
					((listOfProbabilities at: id) > (rand next)) ifTrue: [						
						each currentStatus: (listOfTransitions at: id) toStatus.
						] 						
					]
				]
			].			
		"Update the number of Individuals for each classe"		
		self updateCompartment.	
		count := count + 1.
		t := t + dT.
		].	
	self halt.
	self plot.
	

	
		