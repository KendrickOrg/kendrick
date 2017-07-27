examples
modelRK4SolverOnMultipleRiskGroupsModel
	| tmp1 tmp2 |
	tmp2 := self riskGroupConcern.
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I))};
		addParameter: #beta value: 1.6e-8;
		addParameter: #gamma value: 0.2;
		addParameter: #lambda value: 'beta*I';
		addEquation: 'S:t=gamma*I-lambda*S';
		addEquation: 'I:t=lambda*S-gamma*I';
		integrate: tmp2;
		addParameter: #rho
			value: [ :arg1 | 
			| tmp3 tmp4 |
			tmp3 := arg1 currentCompartment at: #riskGroup.
			tmp3 = 1
				ifTrue: [ tmp4 := #(0 0 0 0 0) ].
			tmp3 = 2
				ifTrue: [ tmp4 := #(0 9 30 180 300) ].
			tmp3 = 3
				ifTrue: [ tmp4 := #(0 30 100 600 1000) ].
			tmp3 = 4
				ifTrue: [ tmp4 := #(0 180 600 3600 6000) ].
			tmp3 = 5
				ifTrue: [ tmp4 := #(0 300 1000 6000 10000) ].
			tmp4 ];
		atParameter: #lambda
			assignValue: [ :arg2 | 
			((arg2 atParameter: #beta) * (arg2 atCompartment: {(#status -> #I)})
				* (arg2 atParameter: #rho)) sum ];
		atCompartment:
			{(#status -> #I).
			(#riskGroup -> 5)}
			put: 1
			atOthersPut: 0;
		atCompartment:
			{(#status -> #S).
			(#riskGroup -> 1)}
			put: 6000;
		atCompartment:
			{(#status -> #S).
			(#riskGroup -> 2)}
			put: 31000;
		atCompartment:
			{(#status -> #S).
			(#riskGroup -> 3)}
			put: 52000;
		atCompartment:
			{(#status -> #S).
			(#riskGroup -> 4)}
			put: 8000;
		atCompartment:
			{(#status -> #S).
			(#riskGroup -> 5)}
			put: 2999.
	^ tmp1