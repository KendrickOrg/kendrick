examples
exampleIBMSimulatorOnSIRModelWithContactNetworkAmongIndividuals
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	tmp1 := KEModel new population: (KEPopulation size: 100).
	tmp4 := KEModelPart new.
	tmp4
		addAttribute: #status value: #(#S #I #R);
		addParameters: {#beta . #gamma . #lambda};
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #I)}
			probability: 'lambda';
		addTransitionFrom: {(#status -> #I)}
			to: {(#status -> #R)}
			probability: 'gamma'.
	tmp3 := KEModelPart new.
	tmp2 := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 1)}.
	tmp3
		addParameter: #network value: tmp2;
		addAttribute: #node value: tmp2 allContacts.
	tmp1
		integrate: tmp4;
		integrate: tmp3;
		atParameter: #lambda
			assignValue: [ :arg1 | 
			| tmp9 |
			tmp9 := arg1 currentCompartment at: #node.
			((arg1 atParameter: #network)
				contactsOf:
					{arg1.
					(#node -> tmp9).
					(#status -> #I)}) * (arg1 atParameter: #beta)
				/ (arg1 atParameter: #N) ];
		atParameter: #beta assignValue: 1;
		atParameter: #gamma assignValue: 0.1.
	1 to: 99 do: [ :tmp8 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#node -> tmp8 asString asSymbol)}
			put: 1 ].
	tmp1
		atCompartment:
			{(#status -> #I).
			(#node -> #'100')}
		put: 1.
	tmp5 := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		by: 0.1.
	tmp5 executeOn: tmp1.
	tmp7 := [ :arg2 | 
	| tmp10 tmp11 tmp12 |
	tmp11 := (tmp5 allTimesSeriesContaining: arg2)
		collect: [ :arg3 | arg3 value ].
	tmp10 := OrderedCollection new.
	tmp12 := tmp11 first data size.
	1 to: tmp12 do: [ :tmp13 | tmp10 add: (tmp11 collect: [ :arg4 | arg4 data at: tmp13 ]) sum ].
	(KETimeSeries from: tmp10 withIndex: tmp11 first index)
		compartment: (STON fromString: arg2) ].
	tmp6 := KEDiagramBuilder new data: {(tmp7 value: '{#status:#I}')}.
	tmp6 open