as yet unclassified
compartimentsIn: constructor

	"Show the list of compartments with the number of individuals"
	
	constructor table
		display: [ :population | population compartments] ;
		column: 'Name' evaluated: [ :compartment | compartment asString] width:120;
		column: 'Number Of Individuals' evaluated: [ :compartment | compartment asString];
		selectionAct: [:courbe | courbe selection inspect] on: $v entitled: 'View'