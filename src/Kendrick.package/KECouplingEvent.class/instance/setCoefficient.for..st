accessing
setCoefficient: value for: model
	couplingCoefficient ifNotNil: [ 
		model temporalParameters at: couplingCoefficient put: value
		 ]