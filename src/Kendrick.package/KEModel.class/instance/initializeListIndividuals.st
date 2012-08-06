as yet unclassified
initializeListIndividuals

| populationSize listOfIndividuals count |
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
	^listOfIndividuals