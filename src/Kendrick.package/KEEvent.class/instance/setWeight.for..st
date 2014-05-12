accessing
setWeight: weight for: model
	interPopWeightName ifNotNil: [ 
		model temporalParameters at: interPopWeightName put: weight
		 ]