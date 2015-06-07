accessing
evaluateForceOfInfection: model formula: formula
	"graphs first isCommutingNetwork 
	ifTrue: [ ^ graphs first forceOfInfection: model ]
	ifFalse: [ ^ super evaluateForceOfInfection: model formula: formula ]"
	^ graphs first evaluateForceOfInfection: model formula: formula