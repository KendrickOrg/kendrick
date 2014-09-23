acessing
evaluateWithModel: aModel
	|result currentPID tmpPopulation|
	result := 0.
	currentPID := aModel currentPopulationID.
	tmpPopulation := aModel population at: currentPID.
	[ tmpPopulation parent isNil ] whileFalse: [ 
		result := result + (self evaluateOnPopulation: tmpPopulation withModel: aModel).
		tmpPopulation := tmpPopulation parent.
	].
	aModel currentPopulationID: currentPID.
	aModel temporalParameters removeKey: couplingParameter.
	(self variable) ifNotNil: [ 
		result := result * ((aModel population at: currentPID) at: variable) currentNbIndividuals 	
	].
	^ result