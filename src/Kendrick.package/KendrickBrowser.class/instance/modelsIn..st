as yet unclassified
modelsIn: constructor
	"Show the list of model"
	constructor list
		display: [ :model | model ];
		format: [:model | model name]