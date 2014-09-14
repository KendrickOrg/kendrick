as yet unclassified
compartimentsIn: constructor

	"Show the list of compartments with the number of individuals"
	
	constructor table
		display: [ :population | population getCompartments] ;
		column: 'Name' evaluated: [ :compartment | compartment status] width:120;
		column: 'Number Of Individuals' evaluated: [ :compartment | compartment getNbIndividuals asString];
		selectionAct: [:courbe | courbe selection inspect] on: $v entitled: 'View'