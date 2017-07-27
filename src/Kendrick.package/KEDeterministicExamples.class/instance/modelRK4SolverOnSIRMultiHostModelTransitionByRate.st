examples
modelRK4SolverOnSIRMultiHostModelTransitionByRate
	| tmp1 tmp2 |
	tmp2 := KEModelPart new.
	tmp2
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 13000);
		attributes: {(#status -> #(#S #I #R))};
		addParameter: #mu value: 12.17;
		addParameter: #gamma value: 52;
		addParameter: #beta value: 1;
		addParameter: #lambda
			value: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: 'lambda' parseAsAnExpression;
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: 'gamma' parseAsAnExpression;
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: 'mu' parseAsAnExpression;
		addTransitionFrom: '{#status: #I}'
			to: #empty
			probability: 'mu' parseAsAnExpression;
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: 'mu' parseAsAnExpression;
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: 'mu' parseAsAnExpression;
		integrate: tmp2;
		atParameter: #mu
			assignValue: [ :arg2 | 
			| tmp3 tmp4 |
			tmp3 := arg2 currentCompartment at: #species.
			tmp3 = #mosquito
				ifTrue: [ tmp4 := 12.17 ].
			tmp3 = #reservoir1
				ifTrue: [ tmp4 := 0.05 ].
			tmp3 = #reservoir2
				ifTrue: [ tmp4 := 0.05 ].
			tmp4 ];
		atParameter: #N
			assignValue: [ :arg3 | 
			| tmp5 |
			tmp5 := arg3 currentCompartment at: #species.
			arg3 sizeOfPopulation: tmp5 ];
		addParameter: #rho
			value: [ :arg4 | 
			| tmp6 tmp7 |
			tmp6 := arg4 currentCompartment at: #species.
			tmp6 = #mosquito
				ifTrue: [ tmp7 := #(0 0.02 0.02) ].
			tmp6 = #reservoir1
				ifTrue: [ tmp7 := #(0.02 0 0) ].
			tmp6 = #reservoir2
				ifTrue: [ tmp7 := #(0.02 0 0) ].
			tmp7 ];
		atParameter: #lambda
			assignValue: [ :arg5 | 
			((arg5 atParameter: #beta) * (arg5 atParameter: #rho)
				* (arg5 atCompartment: {(#status -> #I)})) sum ];
		atCompartment:
			{(#status -> #S).
			(#species -> #mosquito)}
			put: 9999;
		atCompartment:
			{(#status -> #I).
			(#species -> #mosquito)}
			put: 1;
		atCompartment:
			{(#status -> #R).
			(#species -> #mosquito)}
			put: 0;
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir1)}
			put: 1000;
		atCompartment:
			{(#status -> #I).
			(#species -> #reservoir1)}
			put: 0;
		atCompartment:
			{(#status -> #R).
			(#species -> #reservoir1)}
			put: 0;
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir2)}
			put: 2000;
		atCompartment:
			{(#status -> #I).
			(#species -> #reservoir2)}
			put: 0;
		atCompartment:
			{(#status -> #R).
			(#species -> #reservoir2)}
			put: 0.
	^ tmp1