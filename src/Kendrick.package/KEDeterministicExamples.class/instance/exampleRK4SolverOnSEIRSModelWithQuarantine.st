examples
exampleRK4SolverOnSEIRSModelWithQuarantine
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
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
	tmp3 := KEModelPart dependOn: tmp2.
	tmp3
		addTransitionFrom: {(#status -> #R)}
			to: {(#status -> #S)}
			probability: 'nu';
		addParameter: #nu.
	tmp4 := KEModelPart dependOn: tmp2.
	tmp4
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
		integrate: tmp3;
		integrate: tmp4;
		atParameter: #beta assignValue: 2.14;
		atParameter: #gamma assignValue: 0.143;
		atParameter: #sigma assignValue: 0.125;
		atParameter: #mu assignValue: 3.51e-5;
		atParameter: #nu assignValue: 0.00274;
		atParameter: #delta assignValue: 0.068;
		atParameter: #epsilon assignValue: 0.027;
		atCompartment: {(#status -> #S)} put: 4999;
		atCompartment: {(#status -> #I)} put: 1;
		atCompartment: {(#status -> #R)} put: 0;
		atCompartment: {(#status -> #E)} put: 0.
	tmp5 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		by: 1.
	tmp5 executeOn: tmp1.
	tmp6 := KEDiagramBuilder new.
	tmp6
		data: tmp5 timeSeries;
		xLabel: 'Time (year)';
		open