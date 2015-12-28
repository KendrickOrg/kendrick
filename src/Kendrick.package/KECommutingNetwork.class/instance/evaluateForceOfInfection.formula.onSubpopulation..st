as yet unclassified
evaluateForceOfInfection: model formula: formula onSubpopulation: nodeLabel
"calculating the force of infection of susceptible presenting at subpopulation j at the moment"
	|currentCompartment tmp lambda|
	currentCompartment := model currentCompartment.
	"set in processing location"
	tmp := currentCompartment copy.
	tmp at: self attribute put: ((Dictionary newFrom: nodeLabel) at: self attribute).
	model currentCompartment: tmp.
	"calculate local force of infection"
	lambda := formula value: model.
	"reset current in processing compartment"
	model currentCompartment: currentCompartment.
	^ lambda