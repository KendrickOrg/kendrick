as yet unclassified
beforeBench
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		addAttribute: #status value: #(#S #E #I #R);
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addEquations:
			{'S:t=mu*N - beta*S*I - mu*S' . 'E:t=beta*S*I - sigma*E - mu*E'.
			'I:t=sigma*E - gamma*I - mu*I' . 'R:t=gamma*I - mu*R'};
		addParameters:
			{(#beta -> 2.14e-5).
			(#gamma -> 0.143).
			(#mu -> 3.51e-5).
			(#sigma -> 0.125)}.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 150
		by: 1.
	tmp2 executeOn: tmp1