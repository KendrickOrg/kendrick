as yet unclassified
compartimentsIn: constructor
	"Show the list of compartiments"
	constructor list
		display: [ :model| model compartments];
		format: [ :model| model status]