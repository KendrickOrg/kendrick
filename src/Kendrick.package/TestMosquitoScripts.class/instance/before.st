as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 |
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
			probability: [ :arg2 | arg2 atParameter: #lambda ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg3 | arg3 atParameter: #gamma ].
	#(#S #I #R)
		do: [ :arg4 | 
			tmp1
				addTransitionFrom: {(#status -> arg4)}
				to: #empty
				probability: [ :arg5 | arg5 atParameter: #mu ] ].
	tmp1
		addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [ :arg6 | arg6 atParameter: #mu ].
	tmp2 := KEModelPart new.
	tmp2
		addAttribute: #species
		value: #(#mosquito #reservoir1 #reservoir2).
	tmp1
		integrate: tmp2;
		atParameter: #mu
			assignValue: [ :arg7 | 
			| tmp5 tmp6 |
			tmp5 := arg7 currentCompartment at: #species.
			tmp5 = #mosquito
				ifTrue: [ tmp6 := 12.17 ].
			tmp5 = #reservoir1
				ifTrue: [ tmp6 := 0.05 ].
			tmp5 = #reservoir2
				ifTrue: [ tmp6 := 0.05 ].
			tmp6 ];
		atParameter: #N
			assignValue: [ :arg8 | 
			| tmp7 |
			tmp7 := arg8 currentCompartment at: #species.
			arg8 sizeOfPopulation: tmp7 ];
		addParameter: #rho
			value: [ :arg9 | 
			| tmp8 tmp9 |
			tmp8 := arg9 currentCompartment at: #species.
			tmp8 = #mosquito
				ifTrue: [ tmp9 := #(0 0.02 0.02) ].
			tmp8 = #reservoir1
				ifTrue: [ tmp9 := #(0.02 0 0) ].
			tmp8 = #reservoir2
				ifTrue: [ tmp9 := #(0.02 0 0) ].
			tmp9 ];
		atParameter: #lambda
			assignValue: [ :arg10 | 
			((arg10 atParameter: #beta) * (arg10 atParameter: #rho)
				* (arg10 atCompartment: {(#status -> #I)})) sum ];
		atCompartment:
			{(#status -> #I).
			(#species -> #mosquito)}
			put: 1
			atOthersPut: 0;
		atCompartment:
			{(#status -> #S).
			(#species -> #mosquito)}
			put: 9999;
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir1)}
			put: 1000;
		atCompartment:
			{(#status -> #S).
			(#species -> #reservoir2)}
			put: 2000.
	tmp3 := KESimulator
		new: #Gillespie
		from: 0.0
		to: 0.5
		by: 0.0027.
	tmp3 executeOn: tmp1.
	tmp4 := KEDiagramBuilder new
		data: (tmp3 allTimesSeriesContaining: '{#status: #I}') sqrt.
	tmp4 open.
	^ tmp3 -> tmp1