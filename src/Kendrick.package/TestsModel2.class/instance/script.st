as yet unclassified
script
	| tmp2 tmp4 tmp6 tmp8 tmp10 |
	tmp2 := KendrickModel SIR.
	tmp2
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu);
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	KendrickModel Biological attribute: #(#species #-> #human #bird).
	tmp4 := Composition SIRInfluenza.
	tmp4
		model: 'Influenza';
		populationSize: 5500;
		concern: 'Biological';
		concern: 'SIR';
		lambda: #(#beta #* #I #/ #N #sum);
		N: #(#species).
	tmp6 := Scenario SIRInfluenza1.
	tmp6
		on: 'SIRInfluenza';
		mu_species: #(3.65e-5 0.00137);
		gamma_species: #(0.25 0.233);
		beta_species: #(#(0 0.21) #(0 0.42));
		S_species: #(500 4990);
		I_species: #(0 10).
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