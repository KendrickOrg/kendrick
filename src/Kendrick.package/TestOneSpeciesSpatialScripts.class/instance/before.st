as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := KEModelPart new.
	tmp1
		addAttribute: #patch value: (1 to: 5) asArray;
		addParameter: #rho.
	(1 to: 5)
		do: [ :arg1 | 
			arg1 < 5
				ifTrue: [ tmp1
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> (arg1 + 1))}
						probability: [ :arg2 | arg2 atParameter: #rho ] ]
				ifFalse: [ tmp1
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> 1)}
						probability: [ :arg3 | arg3 atParameter: #rho ] ] ].
	tmp2 := KEModelPart new.
	tmp2
		attributes: {(#status -> #(#S #E #I #R))};
		addParameters: {#beta . #gamma . #mu . #sigma . #v};
		addParameter: #lambda
			value: [ :arg4 | 
			(arg4 atParameter: #beta) * (arg4 atCompartment: {(#status -> #I)})
				/ (arg4 atParameter: #N) ];
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #E}'
			probability: [ :arg5 | arg5 atParameter: #lambda ];
		addTransitionFrom: '{#status: #E}'
			to: '{#status: #I}'
			probability: [ :arg6 | arg6 atParameter: #sigma ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg7 | arg7 atParameter: #gamma ];
		addTransitionFrom: '{#status: #R}'
			to: '{#status: #S}'
			probability: [ :arg8 | arg8 atParameter: #v ].
	#(#S #E #I #R)
		do: [ :arg9 | 
			tmp2
				addTransitionFrom: {(#status -> arg9)}
				to: #empty
				probability: [ :arg10 | arg10 atParameter: #mu ] ].
	tmp2
		addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [ :arg11 | arg11 atParameter: #mu ].
	tmp3 := KEModel new.
	tmp3
		population: (KEPopulation size: 5000);
		integrate: tmp1;
		integrate: tmp2;
		atParameter: #beta
			assignValue: [ :arg12 | 
			| tmp6 tmp7 |
			tmp6 := arg12 currentCompartment at: #patch.
			tmp6 = 1
				ifTrue: [ tmp7 := 0.75 ]
				ifFalse: [ tmp7 := 0.5 ].
			tmp7 ];
		atParameter: #v assignValue: 0.00274;
		atParameter: #mu assignValue: 3.65e-5;
		atParameter: #sigma assignValue: 0.5;
		atParameter: #gamma assignValue: 0.25;
		atParameter: #N
			assignValue: [ :arg13 | 
			| tmp8 |
			tmp8 := arg13 currentCompartment at: #patch.
			arg13 sizeOfPopulation: tmp8 ];
		atParameter: #rho assignValue: 0.03;
		atParameter: #lambda
			assignValue: [ :arg14 | 
			| tmp9 |
			tmp9 := arg14 currentCompartment at: #patch.
			(arg14 atParameter: #beta)
				*
					(arg14
						atCompartment:
							{(#status -> #I).
							(#patch -> tmp9)}) / (arg14 atParameter: #N) ];
		atCompartment:
			{(#status -> #S).
			(#patch -> 1)}
			put: 900
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I).
			(#patch -> 1)}
			put: 100;
		atCompartment:
			{(#status -> #S).
			(#patch -> 2)}
			put: 1000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 3)}
			put: 1000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 4)}
			put: 1000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 5)}
			put: 1000.
	tmp4 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp4 executeOn: tmp3.
	tmp5 := KEDiagramBuilder new.
	tmp5
		data:
			[ | tmp10 |
			tmp10 := OrderedCollection new.
			tmp10
				addAll: (tmp4 allTimesSeriesContaining: '{#status: #I,#patch:1}');
				addAll: (tmp4 allTimesSeriesContaining: '{#status: #I,#patch:2}');
				addAll: (tmp4 allTimesSeriesContaining: '{#status: #I,#patch:3}');
				addAll: (tmp4 allTimesSeriesContaining: '{#status: #I,#patch:4}');
				addAll: (tmp4 allTimesSeriesContaining: '{#status: #I,#patch:5}').
			tmp10 ] value;
		legends: {'patch 1' . 'patch 2' . 'patch 3' . 'patch 4' . 'patch 5'};
		legendTitle: 'Infectious';
		xLabel: 'Time (days)';
		open.
	^ {tmp4.
	tmp3.
	tmp5}