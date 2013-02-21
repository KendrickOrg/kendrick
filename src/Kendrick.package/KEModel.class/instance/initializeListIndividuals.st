initialization
initializeListIndividuals

listOfIndividuals := Bag new.	
compartments do: [:each|
	(each numberOfIndividuals > 0) ifTrue: [
		(each numberOfIndividuals) timesRepeat: [
			|anIndividual|
			anIndividual := (KEIndividual new) currentStatus: (each status); nextStatus: nil. 			
			listOfIndividuals add: anIndividual.	
			]
		]
	].		