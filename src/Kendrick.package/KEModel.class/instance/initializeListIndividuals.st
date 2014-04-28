initialization
initializeListIndividuals

	listOfIndividuals := OrderedCollection new.
	compartments do: [ :each |
		1 to: (each numberOfSpecies) do: [ :id | 
			|nbldv|
			nbldv := (each numberOfIndividuals) at: id.
			nbldv > 0 ifTrue:[
				nbldv timesRepeat: [
					|anIndividual|
					anIndividual := (KEIndividual new) currentStatus: (each status); nextStatus: nil; specieID: id.
					
					listOfIndividuals add: anIndividual.
					]
				]
			]
		]. 