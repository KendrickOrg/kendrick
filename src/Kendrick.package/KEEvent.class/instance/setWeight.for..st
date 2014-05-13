accessing
setWeight: value for: model
	weight ifNotNil: [ 
		model temporalParameters at: weight put: value
		 ]