accessing
initCompartments
	initCompartments ifNil: [ 
		initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]) ].
	^ initCompartments 
	