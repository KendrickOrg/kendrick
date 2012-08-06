as yet unclassified
runIndividualBasedSimulationFor: tMax withStep: dT
	| numberStep listOfIndividuals count listOfProbabilities rand listOfTransitions |
	"Initializing"
	numberStep := (0 to: tMax by: dT) size.
	result := Array new: numberStep.
	rand := Random new.
	"Finding transition of each event in eventList. If event has no transition, toStatus: nil"
	listOfTransitions := self generateTransitionOfEvents.	
	"Initializing a list of individuals in the population"
	listOfIndividuals := self initializeListIndividuals.
	"Do a loop from 0 to tMax with time step = dT"
	listOfProbabilities := Array new: (listOfTransitions size).
	result at: 1 put: (Array with: 0 with: (self numberOfIndividualsAtCompartment: #I)).
	count:=2.
	(dT to: tMax by: dT) do: [:t|
		"Calculate rate of each event in the eventList and transform it into probability"
		1 to: (listOfTransitions size) do: [:id|
			|rateValue proba|
			rateValue := ((listOfTransitions at: id) evaluateWithModel: self) abs.
			proba := 1 - ((dT*rateValue*(-1)) exp).
			listOfProbabilities at: id put: proba.
			].		
		"For each individual in the listOfIndividuals, calculate the nextStatus"
		1 to: (listOfIndividuals size) do: [:id|
			"For each event in the list of events"			
			1 to: (listOfTransitions size) do: [:id2|
				((listOfIndividuals at: id) currentStatus = (listOfTransitions at: id2) fromStatus) ifTrue: [					
					(((listOfProbabilities at: id2) > (rand next)) & ((listOfProbabilities at: id2) > 0)) ifTrue: [						
						(listOfIndividuals at: id) currentStatus: (listOfTransitions at: id2) toStatus.
						] 						
					]
				]
			].			
		"Update the number of Individuals for each classe"
		compartments do:[:each|
			|ct|
			ct:=0.
			1 to: (listOfIndividuals size) do: [:id|
				((each status) = (listOfIndividuals at: id) currentStatus) ifTrue: [ct:=ct+1].
				].
			each numberOfIndividuals: ct.
			].
		"Debug: print the number of individuals of each compartment"
		Transcript show: (self numberOfIndividualsAtCompartment: #S); cr.
		Transcript show: (self numberOfIndividualsAtCompartment: #I); cr.
		Transcript show: (self numberOfIndividualsAtCompartment: #R); cr.
		Transcript show: '------------------------'; cr.
		"Update result"
		result at: count put: (Array with: t with: (self numberOfIndividualsAtCompartment: #I)).
		count := count + 1.
		].	
	self plot.
	

	
		