as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 |
	tmp1 := KEModel new population: (KEPopulation size: 27500).
	tmp7 := KEModelPart new.
	tmp7 addAttribute: #species value: #(#human #bird).
	tmp4 := KEModelPart new.
	tmp4
		addAttribute: #patch value: (1 to: 5) asArray;
		addParameter: #rho.
	(1 to: 5)
		do: [ :arg1 | 
			arg1 < 5
				ifTrue: [ tmp4
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> (arg1 + 1))}
						probability: [ :arg2 | arg2 atParameter: #rho ] ]
				ifFalse: [ tmp4
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> 1)}
						probability: [ :arg3 | arg3 atParameter: #rho ] ] ].
	tmp8 := KEModelPart new.
	tmp8
		attributes: {(#status -> #(#S #E #I #R))};
		addParameters: {#beta . #gamma . #mu . #sigma . #nu};
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
			probability: [ :arg8 | arg8 atParameter: #nu ].
	#(#S #E #I #R)
		do: [ :arg9 | 
			tmp8
				addTransitionFrom: {(#status -> arg9)}
				to: #empty
				probability: [ :arg10 | arg10 atParameter: #mu ] ].
	tmp8
		addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [ :arg11 | arg11 atParameter: #mu ].
	tmp1
		integrate: tmp4;
		integrate: tmp7;
		integrate: tmp8;
		atParameter: #mu
			assignValue: [ :arg12 | 
			| tmp11 tmp12 |
			tmp11 := arg12 currentCompartment at: #species.
			tmp11 = #human
				ifTrue: [ tmp12 := 3.65e-5 ].
			tmp11 = #bird
				ifTrue: [ tmp12 := 0.00137 ].
			tmp12 ];
		atParameter: #sigma
			assignValue: [ :arg13 | 
			| tmp13 tmp14 |
			tmp13 := arg13 currentCompartment at: #species.
			tmp13 = #human
				ifTrue: [ tmp14 := 0.5 ].
			tmp13 = #bird
				ifTrue: [ tmp14 := 0.67 ].
			tmp14 ];
		atParameter: #gamma
			assignValue: [ :arg14 | 
			| tmp15 tmp16 |
			tmp15 := arg14 currentCompartment at: #species.
			tmp15 = #human
				ifTrue: [ tmp16 := 0.25 ].
			tmp15 = #bird
				ifTrue: [ tmp16 := 0.233 ].
			tmp16 ];
		atParameter: #nu assignValue: 0.00274;
		atParameter: #N
			assignValue: [ :arg15 | 
			| tmp17 |
			tmp17 := OrderedCollection new.
			tmp17
				add: (arg15 currentCompartment at: #patch);
				add: (arg15 currentCompartment at: #species).
			arg15 sizeOfPopulation: tmp17 asArray ];
		atParameter: #rho
			assignValue: [ :arg16 | 
			| tmp18 tmp19 |
			tmp18 := arg16 currentCompartment at: #species.
			tmp18 = #bird
				ifTrue: [ tmp19 := 0.1 ].
			tmp18 = #human
				ifTrue: [ tmp19 := 0.03 ].
			tmp19 ];
		atParameter: #beta
			assignValue: [ :arg17 | 
			| tmp20 tmp21 |
			tmp20 := arg17 currentCompartment at: #species.
			tmp20 = #human
				ifTrue: [ tmp21 := #(0 0.21) ].
			tmp20 = #bird
				ifTrue: [ tmp21 := #(0 0.42) ].
			tmp21 ];
		atParameter: #lambda
			assignValue: [ :arg18 | 
			| tmp22 |
			tmp22 := arg18 currentCompartment at: #patch.
			((arg18 atParameter: #beta)
				*
					(arg18
						atCompartment:
							{(#status -> #I).
							(#patch -> tmp22)}) / (arg18 atParameter: #N)) sum ];
		atCompartment:
			{(#status -> #S).
			(#species -> #bird).
			(#patch -> 1)}
			put: 4990
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I).
			(#species -> #bird).
			(#patch -> 1)}
			put: 10.
	2 to: 5 do: [ :tmp10 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #bird).
				(#patch -> tmp10)}
			put: 5000 ].
	1 to: 5 do: [ :tmp10 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #human).
				(#patch -> tmp10)}
			put: 500 ].
	tmp5 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp5 executeOn: tmp1.
	tmp6 := KEDiagramBuilder new.
	tmp9 := [ :arg19 | 
	| tmp23 tmp24 tmp25 |
	tmp24 := (tmp5 allTimesSeriesContaining: arg19)
		collect: [ :arg20 | arg20 value ].
	tmp23 := OrderedCollection new.
	tmp25 := tmp24 first data size.
	1 to: tmp25 do: [ :tmp26 | tmp23 add: (tmp24 collect: [ :arg21 | arg21 data at: tmp26 ]) sum ].
	(KETimeSeries from: tmp23 withIndex: tmp24 first index)
		compartment: (STON fromString: arg19) ].
	tmp6
		data:
			{(tmp9 value: '{#status:#I, #species:#bird}').
			(tmp9 value: '{#status: #I, #species: #human}')};
		xLabel: 'Time (days)';
		legendTitle: 'Total of infectious';
		legends: {'birds' . 'humans'};
		open.
	^ {tmp5.
	tmp1.
	tmp6}