instance creation
updateEquationsIn: constructor
	"Update the value of equations"
	constructor magritte
			description: [:equation| equation  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v |  browser update ] . 