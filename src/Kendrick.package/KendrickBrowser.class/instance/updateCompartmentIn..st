instance creation
updateCompartmentIn: constructor
	"Update the value of each pannel"
	constructor magritte
			description: [:compartment| compartment  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v | compartment numberOfIndividuals:v. browser update ] . 