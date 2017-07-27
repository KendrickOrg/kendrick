examples
exampleRK4SolverOnSEIRSModelWithTwoStrains
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	tmp1 := KEModel new.
	tmp1 population: (KEPopulation size: 5000).
	tmp2 := KEModelPart new.
	tmp2
		attributes: {(#status -> #(#S #E #I #R))};
		addParameters: {#beta . #gamma . #mu . #sigma};
		addParameter: #lambda value: 'beta*I/N';
		addEquations:
			{'S:t=mu*N - lambda*S - mu*S' . 'E:t=lambda*S - sigma*E - mu*E'.
			'I:t=sigma*E - gamma*I - mu*I' . 'R:t=gamma*I - mu*R'}.
	tmp3 := KEModelPart extends: tmp2.
	tmp3
		addTransitionFrom: {(#status -> #R)}
			to: {(#status -> #S)}
			probability: 'nu';
		addParameter: #nu.
	tmp4 := KEModelPart extends: tmp3.
	tmp4
		splitStatus:
			{#(#I).
			(#strains -> #(1 2))};
		addParameters: {#beta1 . #beta2}.
	tmp1
		integrate: tmp4;
		atParameter: #beta1 assignValue: 0.42;
		atParameter: #beta2 assignValue: 0.0042;
		atParameter: #gamma
			assignValue: [ :arg1 | 
			| tmp8 tmp9 |
			tmp8 := arg1 currentCompartment at: #status.
			tmp8 = #I1
				ifTrue: [ tmp9 := 0.233 ].
			tmp8 = #I2
				ifTrue: [ tmp9 := 0.00233 ].
			tmp9 ];
		atParameter: #sigma
			assignValue: [ :arg2 | 
			| tmp10 tmp11 |
			tmp10 := arg2 nextCompartment at: #status.
			tmp10 = #I1
				ifTrue: [ tmp11 := 0.67 ].
			tmp10 = #I2
				ifTrue: [ tmp11 := 0.0067 ].
			tmp11 ];
		atParameter: #mu assignValue: 0.00137;
		atParameter: #nu assignValue: 0.00274;
		atParameter: #lambda assignValue: '((beta1*I1)+(beta2*I2))/N';
		atCompartment: {(#status -> #S)} put: 4990;
		atCompartment: {(#status -> #I)} put: 0;
		atCompartment: {(#status -> #I1)} put: 10;
		atCompartment: {(#status -> #I2)} put: 0;
		atCompartment: {(#status -> #R)} put: 0;
		atCompartment: {(#status -> #E)} put: 0.
	tmp5 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		by: 1.
	tmp5 executeOn: tmp1.
	tmp6 := KEDiagramBuilder new.
	tmp7 := OrderedCollection new.
	tmp7
		addAll: (tmp5 allTimesSeriesContaining: '{#status: #I1}');
		addAll: (tmp5 allTimesSeriesContaining: '{#status: #I2}').
	tmp6
		data: tmp7;
		xLabel: 'Time (year)';
		open