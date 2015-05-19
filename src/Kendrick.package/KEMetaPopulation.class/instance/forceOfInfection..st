accessing
forceOfInfection: model
	graphs first isCommutingNetwork 
	ifTrue: [ ^ graphs first forceOfInfection: model ]
	ifFalse: [ ^ super forceOfInfection: model ]