examples
exampleIBMSimulatorOnSIREbolaModel
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp4 := KEModelPart new.
	tmp4
		addAttribute: #country
			value: #(#Liberia #Guinea #SierraLeone #Nigeria #Senegal #Niger);
		addParameter: #rho.
	tmp5 := tmp4 atAttribute: #country.
	1 to: 5 do: [ :tmp6 | 
		tmp6 + 1 to: 6 do: [ :tmp7 | 
			tmp4
				addTransitionFrom: {(#country -> (tmp5 at: tmp6))}
					to: {(#country -> (tmp5 at: tmp7))}
					probability: [ :arg1 | arg1 atParameter: #rho ];
				addTransitionFrom: {(#country -> (tmp5 at: tmp7))}
					to: {(#country -> (tmp5 at: tmp6))}
					probability: [ :arg2 | arg2 atParameter: #rho ] ] ].
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 6000);
		addAttribute: #status value: #(#S #I #R);
		addParameter: #gamma value: 0.1;
		addParameter: #beta value: 0.0002;
		addParameter: #lambda
			value: [ :arg3 | (arg3 atParameter: #beta) * (arg3 atCompartment: {(#status -> #I)}) ];
		addEquation: 'S:t=-lambda*S';
		addEquation: 'I:t=lambda*S-gamma*I';
		addEquation: 'R:t=gamma*I';
		integrate: tmp4;
		atParameter: #N
			assignValue: [ :arg4 | 
			| tmp8 |
			tmp8 := arg4 currentCompartment at: #country.
			arg4 sizeOfPopulation: tmp8 ];
		atParameter: #lambda
			assignValue: [ :arg5 | 
			| tmp9 |
			tmp9 := arg5 currentCompartment at: #country.
			(arg5 atParameter: #beta)
				*
					(arg5
						atCompartment:
							{(#status -> #I).
							(#country -> tmp9)}) ];
		atParameter: #rho assignValue: 0.05;
		atCompartment:
			{(#status -> #I).
			(#country -> #Liberia)}
			put: 50
			atOthersPut: 0.
	tmp5
		do: [ :arg6 | 
			arg6 = #Liberia
				ifTrue: [ tmp1
						atCompartment:
							{(#status -> #S).
							(#country -> #Liberia)}
						put: 950 ]
				ifFalse: [ tmp1
						atCompartment:
							{(#status -> #S).
							(#country -> arg6)}
						put: 1000 ] ].
	tmp2 := KESimulator
		new: #IBM
		from: 0.0
		to: 100
		by: 0.1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status: #	I}').
	tmp3
		open;
		openMap: #africa
			countries: (tmp1 atAttribute: #country)
			coloredBy: #peakOfEpidemic