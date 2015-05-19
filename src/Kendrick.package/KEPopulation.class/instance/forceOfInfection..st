accessing
forceOfInfection: model
	|v|
	v := (model parameters) at: model lambda.
	^ v value: model