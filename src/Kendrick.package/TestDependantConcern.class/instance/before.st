as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	tmp2 := KEModelPart new.
	tmp2
		attributes: {(#status -> #(#S #I #R))};
		addParameters: {#lambda . #gamma};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | arg1 atParameter: #lambda ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	tmp4 := KEModelPart new.
	tmp4
		addAttribute: #patch value: (1 to: 5) asArray;
		addParameter: #rho.
	(1 to: 5)
		do: [ :arg3 | 
			arg3 < 5
				ifTrue: [ tmp4
						addTransitionFrom: {(#patch -> arg3)}
						to: {(#patch -> (arg3 + 1))}
						probability: [ :arg4 | arg4 atParameter: #rho ] ]
				ifFalse: [ tmp4
						addTransitionFrom: {(#patch -> arg3)}
						to: {(#patch -> 1)}
						probability: [ :arg5 | arg5 atParameter: #rho ] ] ].
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 5000);
		integrate: tmp4;
		integrate: tmp2.
	tmp3 := KEModelPart dependOn: tmp2.
	tmp3
		atAttribute: #status add: #E;
		removeTransitionFrom: {(#status -> #S)} to: {(#status -> #I)};
		addTransitionFrom: {(#status -> #S)}
			to: {(#status -> #E)}
			probability: [ :arg6 | arg6 atParameter: #lambda ];
		addTransitionFrom: {(#status -> #E)}
			to: {(#status -> #I)}
			probability: [ :arg7 | arg7 atParameter: #sigma ];
		addTransitionFrom: {(#status -> #E)}
			to: #empty
			probability: [ :arg8 | arg8 atParameter: #mu ];
		addParameter: #sigma.
	tmp1
		integrate: tmp3;
		atParameter: #beta
			assignValue: [ :arg9 | 
			| tmp7 tmp8 |
			tmp7 := arg9 currentCompartment at: #patch.
			tmp7 = 1
				ifTrue: [ tmp8 := 0.75 ]
				ifFalse: [ tmp8 := 0.5 ].
			tmp8 ];
		atParameter: #mu assignValue: 3.65e-5;
		atParameter: #sigma assignValue: 0.5;
		atParameter: #gamma assignValue: 0.25;
		atParameter: #N
			assignValue: [ :arg10 | 
			| tmp9 |
			tmp9 := arg10 currentCompartment at: #patch.
			arg10 sizeOfPopulation: tmp9 ];
		atParameter: #rho assignValue: 0.03;
		atParameter: #lambda
			assignValue: [ :arg11 | 
			| tmp10 |
			tmp10 := arg11 currentCompartment at: #patch.
			(arg11 atParameter: #beta)
				*
					(arg11
						atCompartment:
							{(#status -> #I).
							(#patch -> tmp10)}) / (arg11 atParameter: #N) ];
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
	tmp5 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp5 executeOn: tmp1.
	tmp6 := KEDiagramBuilder new.
	tmp6
		data:
			[ | tmp11 |
			tmp11 := OrderedCollection new.
			tmp11
				addAll: (tmp5 allTimesSeriesContaining: '{#status: #I,#patch:1}');
				addAll: (tmp5 allTimesSeriesContaining: '{#status: #I,#patch:2}');
				addAll: (tmp5 allTimesSeriesContaining: '{#status: #I,#patch:3}');
				addAll: (tmp5 allTimesSeriesContaining: '{#status: #I,#patch:4}');
				addAll: (tmp5 allTimesSeriesContaining: '{#status: #I,#patch:5}').
			tmp11 ] value;
		legends: {'patch 1' . 'patch 2' . 'patch 3' . 'patch 4' . 'patch 5'};
		legendTitle: 'Infectious';
		xLabel: 'Time (days)';
		open.
	^ {tmp5.
	tmp1.
	tmp6}