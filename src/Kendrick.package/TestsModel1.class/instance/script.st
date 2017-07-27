as yet unclassified
script
	| tmp2 tmp4 tmp6 tmp8 tmp10 |
	tmp2 := KendrickModel SIR.
	tmp2
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu);
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	tmp4 := Composition SIRInfluenza.
	tmp4
		model: 'Influenza';
		concern: 'SIR'.
	tmp6 := Scenario SIRInfluenza1.
	tmp6
		on: 'SIRInfluenza';
		populationSize: 5000;
		S: 4990;
		I: 10;
		others: 0;
		mu: 0.00137;
		gamma: 0.233;
		beta: 0.42.
	tmp8 := Simulation SIRInfluenzaRK rungeKutta.
	tmp8
		scenario: 'SIRInfluenza1';
		from: 0;
		to: 500;
		step: 1.
	tmp10 := Visualization SIRInfluenzaViz diagram.
	tmp10
		for: 'SIRInfluenzaRK';
		xLabel: 'Time (days)'