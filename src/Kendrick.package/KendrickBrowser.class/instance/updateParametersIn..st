instance creation
updateParametersIn: constructor
	"Update the value of parameters"
	constructor magritte
			description: [:equation| equation  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v |  browser update ] . 

	