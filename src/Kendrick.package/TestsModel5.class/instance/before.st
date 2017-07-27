as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 |
	tmp1 := KEModel new.
	tmp1 population: (KEPopulation size: 27500).
	tmp2 := KEModelPart new.
	tmp2
		addAttribute: #status value: #(#S #E #I #R);
		addParameters: {#beta . #gamma . #mu . #sigma . #nu};
		addParameter: #lambda value: 'beta*I/N';
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #E}'
			probability: [ :arg1 | arg1 atParameter: #lambda ];
		addTransitionFrom: '{#status: #E}'
			to: '{#status: #I}'
			probability: [ :arg2 | arg2 atParameter: #sigma ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg3 | arg3 atParameter: #gamma ];
		addTransitionFrom: '{#status: #R}'
			to: '{#status: #S}'
			probability: [ :arg4 | arg4 atParameter: #nu ];
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: [ :arg5 | arg5 atParameter: #mu ];
		addTransitionFrom: '{#status: #I}'
			to: #empty
			probability: [ :arg6 | arg6 atParameter: #mu ];
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: [ :arg7 | arg7 atParameter: #mu ];
		addTransitionFrom: '{#status: #E}'
			to: #empty
			probability: [ :arg8 | arg8 atParameter: #mu ];
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: [ :arg9 | arg9 atParameter: #mu ].
	tmp3 := KEModelPart dependOn: tmp2.
	tmp3
		transitions:
			(tmp2 transitions
				select: [ :arg10 | (arg10 from at: #status) = #I | ((arg10 to at: #status) = #I) ]);
		splitStatus:
			{#(#I).
			(#index -> #(1 2))};
		addParameters: {#beta1 . #beta2}.
	tmp4 := KEModelPart new.
	tmp4 addAttribute: #species value: #(#human #bird).
	tmp5 := KEModelPart new.
	tmp5
		addAttribute: #patch value: (1 to: 5) asArray;
		addParameter: #rho.
	(1 to: 5)
		do: [ :arg11 | 
			arg11 < 5
				ifTrue: [ tmp5
						addTransitionFrom: {(#patch -> arg11)}
						to: {(#patch -> (arg11 + 1))}
						probability: [ :arg12 | arg12 atParameter: #rho ] ]
				ifFalse: [ tmp5
						addTransitionFrom: {(#patch -> arg11)}
						to: {(#patch -> 1)}
						probability: [ :arg13 | arg13 atParameter: #rho ] ] ].
	tmp1
		integrate: tmp2;
		integrate: tmp3;
		integrate: tmp5;
		integrate: tmp4;
		addParameter: #beta1
			value: [ :arg14 | 
			| tmp10 tmp11 |
			tmp10 := arg14 currentCompartment at: #species.
			tmp10 = #human
				ifTrue: [ tmp11 := #(0 0.21) ].
			tmp10 = #bird
				ifTrue: [ tmp11 := #(0 0.42) ].
			tmp11 ];
		addParameter: #beta2
			value: [ :arg15 | 
			| tmp12 tmp13 |
			tmp12 := arg15 currentCompartment at: #species.
			tmp12 = #human
				ifTrue: [ tmp13 := #(0 0.021) ].
			tmp12 = #bird
				ifTrue: [ tmp13 := #(0 0.042) ].
			tmp13 ];
		atParameter: #lambda
			assignValue: [ :arg16 | 
			| tmp14 |
			tmp14 := arg16 currentCompartment at: #patch.
			((arg16 atParameter: #beta1)
				*
					(arg16
						atCompartment:
							{(#status -> #I1).
							(#patch -> tmp14)}) / (arg16 atParameter: #N)
				+
					((arg16 atParameter: #beta2)
						*
							(arg16
								atCompartment:
									{(#status -> #I2).
									(#patch -> tmp14)}) / (arg16 atParameter: #N))) sum ];
		atParameter: #gamma
			assignValue: [ :arg17 | 
			| tmp15 tmp16 tmp17 |
			tmp15 := arg17 currentCompartment at: #species.
			tmp16 := arg17 currentCompartment at: #status.
			(tmp15 = #human & tmp16) = #I1
				ifTrue: [ tmp17 := 0.25 ].
			(tmp15 = #human & tmp16) = #I2
				ifTrue: [ tmp17 := 0.0025 ].
			(tmp15 = #bird & tmp16) = #I1
				ifTrue: [ tmp17 := 0.233 ].
			(tmp15 = #bird & tmp16) = #I2
				ifTrue: [ tmp17 := 0.0023 ].
			tmp17 ];
		atParameter: #sigma
			assignValue: [ :arg18 | 
			| tmp18 tmp19 tmp20 |
			tmp18 := arg18 currentCompartment at: #species.
			tmp19 := arg18 nextCompartment at: #status.
			(tmp18 = #human & tmp19) = #I1
				ifTrue: [ tmp20 := 0.5 ].
			(tmp18 = #human & tmp19) = #I2
				ifTrue: [ tmp20 := 0.005 ].
			(tmp18 = #bird & tmp19) = #I1
				ifTrue: [ tmp20 := 0.67 ].
			(tmp18 = #bird & tmp19) = #I2
				ifTrue: [ tmp20 := 0.0067 ].
			tmp20 ];
		atParameter: #mu
			assignValue: [ :arg19 | 
			| tmp21 tmp22 |
			tmp21 := arg19 currentCompartment at: #species.
			tmp21 = #human
				ifTrue: [ tmp22 := 0.000365 ].
			tmp21 = #bird
				ifTrue: [ tmp22 := 0.00137 ].
			tmp22 ];
		atParameter: #N
			assignValue: [ :arg20 | 
			| tmp23 |
			tmp23 := OrderedCollection new.
			tmp23
				add: (arg20 currentCompartment at: #patch);
				add: (arg20 currentCompartment at: #species).
			arg20 sizeOfPopulation: tmp23 asArray ];
		atParameter: #nu assignValue: 0.00274;
		atParameter: #rho
			assignValue: [ :arg21 | 
			| tmp24 tmp25 |
			tmp24 := arg21 currentCompartment at: #species.
			tmp24 = #bird
				ifTrue: [ tmp25 := 0.1 ].
			tmp24 = #human
				ifTrue: [ tmp25 := 0.03 ].
			tmp25 ];
		atCompartment:
			{(#status -> #S).
			(#species -> #bird).
			(#patch -> 1)}
			put: 4990
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I1).
			(#species -> #bird).
			(#patch -> 1)}
			put: 9;
		atCompartment:
			{(#status -> #I2).
			(#species -> #bird).
			(#patch -> 1)}
			put: 1.
	2 to: 5 do: [ :tmp9 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #bird).
				(#patch -> tmp9)}
			put: 5000 ].
	1 to: 5 do: [ :tmp9 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #human).
				(#patch -> tmp9)}
			put: 500 ].
	tmp6 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 500
		by: 1.
	tmp6 executeOn: tmp1.
	tmp7 := KEDiagramBuilder new.
	tmp8 := [ :arg22 | 
	| tmp26 tmp27 tmp28 |
	tmp27 := (tmp6 allTimesSeriesContaining: arg22)
		collect: [ :arg23 | arg23 value ].
	tmp26 := OrderedCollection new.
	tmp28 := tmp27 first data size.
	1 to: tmp28 do: [ :tmp29 | tmp26 add: (tmp27 collect: [ :arg24 | arg24 data at: tmp29 ]) sum ].
	(KETimeSeries from: tmp26 withIndex: tmp27 first index)
		compartment: (STON fromString: arg22) ].
	tmp7
		data:
			{(tmp8 value: '{#status:#I1,#species:#bird}').
			(tmp8 value: '{#status:#I1,#species: #human}').
			(tmp8 value: '{#status:#I2,#species:#bird}').
			(tmp8 value: '{#status:#I2,#species: #human}')};
		xLabel: 'Time (days)';
		legendTitle: 'Total of infectious';
		legends:
			{'birds strains 1' . 'humans strains 1' . 'birds strains 2'.
			'humans strains 2'};
		open.
	^ {tmp6.
	tmp1.
	tmp7}