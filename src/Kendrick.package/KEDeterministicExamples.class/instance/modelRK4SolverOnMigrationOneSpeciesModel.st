examples
modelRK4SolverOnMigrationOneSpeciesModel
	| tmp1 tmp2 tmp3 |
	tmp3 := self SEIRSConcern.
	tmp2 := self spatialConcern.
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 25000);
		integrate: tmp2;
		integrate: tmp3;
		atParameter: #beta
			assignValue: [ :arg1 | 
			| tmp4 tmp5 |
			tmp4 := arg1 currentCompartment at: #patch.
			tmp4 = 1
				ifTrue: [ tmp5 := 0.42 ]
				ifFalse: [ tmp5 := 0.28 ].
			tmp5 ];
		atParameter: #v assignValue: 0.00274;
		atParameter: #mu assignValue: 0.00137;
		atParameter: #sigma assignValue: 0.67;
		atParameter: #gamma assignValue: 0.233;
		atParameter: #N
			assignValue: [ :arg2 | 
			| tmp6 |
			tmp6 := arg2 currentCompartment at: #patch.
			arg2 sizeOfPopulation: tmp6 ];
		atParameter: #rho assignValue: 0.1;
		atParameter: #lambda
			assignValue: [ :arg3 | 
			| tmp7 |
			tmp7 := arg3 currentCompartment at: #patch.
			(arg3 atParameter: #beta)
				*
					(arg3
						atCompartment:
							{(#status -> #I).
							(#patch -> tmp7)}) / (arg3 atParameter: #N) ];
		atCompartment:
			{(#status -> #S).
			(#patch -> 1)}
			put: 4990
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I).
			(#patch -> 1)}
			put: 10;
		atCompartment:
			{(#status -> #S).
			(#patch -> 2)}
			put: 5000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 3)}
			put: 5000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 4)}
			put: 5000;
		atCompartment:
			{(#status -> #S).
			(#patch -> 5)}
			put: 5000.
	^ tmp1