as yet unclassified
equationsIn: constructor
	"Show the list of equations"
	constructor list
		display: [ :model| model equations];
		format: [ :model| model expression asString]
