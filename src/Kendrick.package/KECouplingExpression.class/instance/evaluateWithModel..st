acessing
evaluateWithModel: aModel
	|result tmpPopulation currentPop|
	result := 0.
	"currentPID := aModel currentPopulationID."
	currentPop := aModel currentSubPopulation.
	tmpPopulation := currentPop.
	[ tmpPopulation parent isNil ] whileFalse: [ 
		result := result + (self evaluateOnPopulation: tmpPopulation withModel: aModel).
		tmpPopulation := tmpPopulation parent.
	].
	aModel currentSubPopulation: currentPop.
	aModel temporalParameters removeKey: couplingParameter.
	(self variable) ifNotNil: [ 
		result := result * ((aModel currentSubPopulation) at: variable) currentNbIndividuals 	
	].
	^ result