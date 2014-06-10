as yet unclassified
compartimentsIn: constructor

	"Show the list of compartments with the number of individuals"
	
	constructor table
		display: [ :model | model compartments] ;
		column: 'Name' evaluated: [ :compartment | compartment status] width:120;
		column: 'Number Of Individuals' evaluated: [ :compartment | compartment numberOfIndividuals first asString].