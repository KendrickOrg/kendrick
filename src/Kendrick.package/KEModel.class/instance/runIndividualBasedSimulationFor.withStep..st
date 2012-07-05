as yet unclassified
runIndividualBasedSimulationFor: tMax withStep: dT
	| numberStep listOfIndividuals populationSize count listOfNewEvents listOfProbabilities rand|
	"Initializing"
	numberStep := (0 to: tMax by: dT) size.
	result := Array new: numberStep.
	rand := Random new.
	"Finding all of events"
	eventList := self generateEvents.
	"Finding transition of each event in eventList. If event has no transition, toStatus: nil"
	listOfNewEvents := Array new: (eventList size).
	count := 1.
	eventList do:[:eachEvent|
		|anEvent|
		anEvent := (KEEventExtended new) rate: (eachEvent rate); actions: (eachEvent actions); fromStatus: nil; toStatus: nil.		
		eachEvent actions keysAndValuesDo:[:status :modification |				
			(modification > 0) ifTrue: [anEvent toStatus: status].
			(modification < 0) ifTrue: [anEvent fromStatus: status].
			].
		listOfNewEvents at: count put: anEvent.
		count := count + 1.
		].
	"Initializing a list of individuals in the population"
	populationSize := 0.
	compartments do: [:each|
		populationSize := (populationSize + (each numberOfIndividuals)).
		].
	listOfIndividuals := Array new: populationSize.	
	count:= 1.
	compartments do: [:each|
		(each numberOfIndividuals > 0) ifTrue: [
			(each numberOfIndividuals) timesRepeat: [
				|anIndividual|
				anIndividual := (KEIndividual new) currentStatus: (each status); nextStatus: nil. 
				listOfIndividuals at: count put: anIndividual.
				count := count + 1.
				]
			]
		].	
	"Do a loop from 0 to tMax with time step = dT"
	listOfProbabilities := Array new: (listOfNewEvents size).
	count:=1.
	(0 to: tMax by: dT) do: [:t|
		"Calculate rate of each event in the eventList and transform it into probability"
		1 to: (listOfNewEvents size) do: [:id|
			|rateValue proba|
			rateValue := ((listOfNewEvents at: id) evaluateWithModel: self) abs.
			proba := 1 - ((dT*rateValue*(-1)) exp).
			listOfProbabilities at: id put: proba.
			].
		"For each individual in the listOfIndividuals, calculate the nextStatus"
		1 to: (listOfIndividuals size) do: [:id|
			"For each event in the list of events"			
			1 to: (listOfNewEvents size) do: [:id2|
				((listOfIndividuals at: id) currentStatus = (listOfNewEvents at: id2) fromStatus) ifTrue: [					
					((listOfProbabilities at: id2) > (rand next)) ifTrue: [
						"|anIndividual|
						anIndividual := (KEIndividual new) currentStatus: (listOfNewEvents at: id2) toStatus; nextStatus: nil."
						"listOfIndividuals at: id put: anIndividual."
						(listOfIndividuals at: id) currentStatus: (listOfNewEvents at: id2) toStatus.
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
		"Update result"
		result at: count put: (Array with: t with: (self numberOfIndividualsAtCompartment: #I)).
		count := count + 1.
		].
"	self halt."
	self plot.
	

	
		