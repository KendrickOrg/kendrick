examples
modelRK4SolverOnMigrationTwoSpeciesModel
	| tmp1 tmp2 tmp3 tmp4 |
	tmp2 := self spatialConcern.
	tmp3 := self SEIRSConcern.
	tmp4 := self multiHostConcern.
	tmp1 := KEModel new population: (KEPopulation size: 27500).
	tmp1
		integrate: tmp2;
		integrate: tmp4;
		integrate: tmp3;
		atParameter: #beta assignValue: 1;
		atParameter: #mu
			assignValue: [ :arg1 | 
			| tmp6 tmp7 |
			tmp6 := arg1 currentCompartment at: #species.
			tmp6 = #human
				ifTrue: [ tmp7 := 0.000365 ].
			tmp6 = #bird
				ifTrue: [ tmp7 := 0.00137 ].
			tmp7 ];
		atParameter: #sigma
			assignValue: [ :arg2 | 
			| tmp8 tmp9 |
			tmp8 := arg2 currentCompartment at: #species.
			tmp8 = #human
				ifTrue: [ tmp9 := 0.5 ].
			tmp8 = #bird
				ifTrue: [ tmp9 := 0.67 ].
			tmp9 ];
		atParameter: #gamma
			assignValue: [ :arg3 | 
			| tmp10 tmp11 |
			tmp10 := arg3 currentCompartment at: #species.
			tmp10 = #human
				ifTrue: [ tmp11 := 0.25 ].
			tmp10 = #bird
				ifTrue: [ tmp11 := 0.233 ].
			tmp11 ];
		atParameter: #v assignValue: 0.00274;
		atParameter: #N
			assignValue: [ :arg4 | 
			| tmp12 |
			tmp12 := OrderedCollection new.
			tmp12
				add: (arg4 currentCompartment at: #patch);
				add: (arg4 currentCompartment at: #species).
			arg4 sizeOfPopulation: tmp12 asArray ];
		atParameter: #rho
			assignValue: [ :arg5 | 
			| tmp13 tmp14 |
			tmp13 := arg5 currentCompartment at: #species.
			tmp13 = #bird
				ifTrue: [ tmp14 := 0.1 ].
			tmp13 = #human
				ifTrue: [ tmp14 := 0.03 ].
			tmp14 ];
		addParameter: #delta
			value: [ :arg6 | 
			| tmp15 tmp16 |
			tmp15 := arg6 currentCompartment at: #species.
			tmp15 = #human
				ifTrue: [ tmp16 := #(0 0.21) ].
			tmp15 = #bird
				ifTrue: [ tmp16 := #(0 0.42) ].
			tmp16 ];
		atParameter: #lambda
			assignValue: [ :arg7 | 
			| tmp17 |
			tmp17 := arg7 currentCompartment at: #patch.
			((arg7 atParameter: #beta) * (arg7 atParameter: #delta)
				*
					(arg7
						atCompartment:
							{(#status -> #I).
							(#patch -> tmp17)}) / (arg7 atParameter: #N)) sum ];
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
	2 to: 5 do: [ :tmp5 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #bird).
				(#patch -> tmp5)}
			put: 5000 ].
	1 to: 5 do: [ :tmp5 | 
		tmp1
			atCompartment:
				{(#status -> #S).
				(#species -> #human).
				(#patch -> tmp5)}
			put: 500 ].
	^ tmp1