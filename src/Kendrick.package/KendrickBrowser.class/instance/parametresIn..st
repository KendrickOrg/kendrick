as yet unclassified
parametresIn: constructor

	"Show the list of parameters with its value"

	constructor table
		display: [ :model | model parameters] ;
		column: 'Name' evaluated: [ :parameter| parameter symbol] width:150;
		column: 'Value' evaluated: [ :parameter | parameter value asString];
		selectionAct: [:elt| elt selection inspect ] on: $i entitled: 'Modify'.