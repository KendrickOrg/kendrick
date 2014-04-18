as yet unclassified
buildPopulation: population fromVecteurCompartment: compartments
	"This function will add to each subpopulation of population argument a compartment in compartments argument"
	population getNbSubPopulations = 0 ifTrue: [ 
		compartments do: [ :each|
			|p|
			p := KEPopulation new.
			p addSubPopulation: each.
			population addSubPopulation: p
			 ]
		 ]
	ifFalse: [ 
		1 to: compartments size do: [ :id|
			(population atSubPopulation: id) addSubPopulation: (compartments at: id) 
			 ]
		 ]