as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
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
	tmp4 := KEModelPart new.
	tmp4 addAttribute: #species value: #(#human #bird).
	tmp7 := KEMapBuilder new.
	tmp7
		countries: #(#MyanmarBurma #Cambodia #Laos #Thailand #Vietnam);
		routesFrom: #Thailand toAll: #(#Cambodia);
		routesFrom: #Cambodia toAll: #(#Vietnam);
		routesFrom: #Vietnam toAll: #(#Laos);
		routesFrom: #Laos toAll: #(#MyanmarBurma);
		routesFrom: #MyanmarBurma toAll: #(#Thailand).
	tmp5 := KEModelPart new.
	tmp5
		addAttribute: #country value: tmp7 countries;
		addParameter: #rho;
		transitions: (tmp7 routesToTransitions: 'rho').
	tmp6 := KEModelPart dependOn: tmp2.
	tmp6
		addStatus: #(#Q);
		addTransitionFrom: {(#status -> #I)}
			to: {(#status -> #Q)}
			probability: 'delta';
		addTransitionFrom: {(#status -> #Q)}
			to: {(#status -> #R)}
			probability: 'epsilon';
		addTransitionFrom: {(#status -> #Q)} to: #empty probability: 'mu';
		addParameters: {#delta . #epsilon};
		addParameter: #lambda value: 'beta*I/(N-Q)'.
	tmp1
		integrate: tmp2;
		integrate: tmp4;
		integrate: tmp5;
		integrate: tmp6;
		atParameter: #mu
			assignValue: [ :arg10 | 
			| tmp8 tmp9 |
			tmp8 := arg10 currentCompartment at: #species.
			tmp8 = #human
				ifTrue: [ tmp9 := 0.000365 ].
			tmp8 = #bird
				ifTrue: [ tmp9 := 0.00137 ].
			tmp9 ];
		addParameter: #beta
			value: [ :arg11 | 
			| tmp10 tmp11 tmp12 |
			tmp10 := arg11 currentCompartment at: #species.
			tmp11 := arg11 currentCompartment at: #country.
			tmp10 = #human
				ifTrue: [ tmp12 := #(0 0.21) ].
			tmp10 = #bird
				ifTrue: [ tmp11 = #Thailand
						ifTrue: [ tmp12 := #(0 0.42) ]
						ifFalse: [ tmp12 := #(0 0.28) ] ].
			tmp12 ];
		atParameter: #gamma
			assignValue: [ :arg12 | 
			| tmp13 tmp14 |
			tmp13 := arg12 currentCompartment at: #species.
			tmp13 = #human
				ifTrue: [ tmp14 := 0.25 ].
			tmp13 = #bird
				ifTrue: [ tmp14 := 0.233 ].
			tmp14 ];
		atParameter: #sigma
			assignValue: [ :arg13 | 
			| tmp15 tmp16 |
			tmp15 := arg13 currentCompartment at: #species.
			tmp15 = #human
				ifTrue: [ tmp16 := 0.5 ].
			tmp15 = #bird
				ifTrue: [ tmp16 := 0.67 ].
			tmp16 ];
		atParameter: #nu assignValue: 0.00274;
		atParameter: #N
			assignValue: [ :arg14 | 
			| tmp17 |
			tmp17 := OrderedCollection new.
			tmp17
				add: (arg14 currentCompartment at: #country);
				add: (arg14 currentCompartment at: #species).
			arg14 sizeOfPopulation: tmp17 asArray ];
		atParameter: #lambda
			assignValue: [ :arg15 | 
			| tmp18 |
			tmp18 := arg15 currentCompartment at: #country.
			((arg15 atParameter: #beta)
				*
					(arg15
						atCompartment:
							{(#status -> #I).
							(#country -> tmp18)})
				/
					((arg15 atParameter: #N)
						-
							(arg15
								atCompartment:
									{(#status -> #Q).
									(#country -> tmp18)}))) sum ];
		atParameter: #rho
			assignValue: [ :arg16 | 
			| tmp19 tmp20 |
			tmp19 := arg16 currentCompartment at: #species.
			tmp19 = #bird
				ifTrue: [ tmp20 := 0.1 ].
			tmp19 = #human
				ifTrue: [ tmp20 := 0.03 ].
			tmp19 := arg16 currentCompartment at: #status.
			tmp19 = #Q
				ifTrue: [ tmp20 := 0 ].
			tmp20 ];
		atParameter: #delta
			assignValue: [ :arg17 | 
			| tmp21 tmp22 |
			tmp21 := arg17 currentCompartment at: #species.
			tmp21 = #human
				ifTrue: [ tmp22 := 0.068 ].
			tmp21 = #bird
				ifTrue: [ tmp22 := 0.055 ].
			tmp22 ];
		atParameter: #epsilon
			assignValue: [ :arg18 | 
			| tmp23 tmp24 |
			tmp23 := arg18 currentCompartment at: #species.
			tmp23 = #human
				ifTrue: [ tmp24 := 0.096 ].
			tmp23 = #bird
				ifTrue: [ tmp24 := 0.082 ].
			tmp24 ];
		atCompartment:
			{(#status -> #S).
			(#species -> #bird).
			(#country -> #Thailand)}
			put: 4990
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I).
			(#species -> #bird).
			(#country -> #Thailand)}
			put: 10.
	#(#MyanmarBurma #Cambodia #Laos #Vietnam)
		do: [ :arg19 | 
			tmp1
				atCompartment:
					{(#status -> #S).
					(#species -> #bird).
					(#country -> arg19)}
				put: 5000 ].
	#(#MyanmarBurma #Cambodia #Laos #Thailand #Vietnam)
		do: [ :arg20 | 
			tmp1
				atCompartment:
					{(#status -> #S).
					(#species -> #human).
					(#country -> arg20)}
				put: 500 ].
	tmp3 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 500
		by: 1.
	tmp3 executeOn: tmp1.
	tmp7
		data:
			(tmp7 countries
				collect: [ :arg21 | 
					(tmp3
						allTimesSeriesContaining:
							{(#status -> #I).
							(#species -> #bird).
							(#country -> arg21)}) first peakOfEpidemic ]);
		open.
	^ {tmp3.
	tmp1.
	tmp7}