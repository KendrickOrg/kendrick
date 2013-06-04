initialization
initializeListIndividuals
	listOfIndividuals := Bag new.
	compartments
		do: [ :each | 
			1 to: each numberOfSpecies do: [ :id | 
				| nbIdv |
				nbIdv := each numberOfIndividuals at: id.
				nbIdv > 0
					ifTrue: [ 
						nbIdv
							timesRepeat: [ 
								| anIndividual |
								anIndividual := KEIndividual new
									currentStatus: each status;
									nextStatus: nil;
									specieID: id.
								listOfIndividuals add: anIndividual ] ] ] ]