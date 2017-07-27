as yet unclassified
script
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 |
	tmp2 := KendrickModel SIR.
	tmp2
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu);
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	KendrickModel Biological attribute: #(#species #-> #human #bird).
	tmp4 := KendrickModel Demographical.
	tmp4
		attribute: #(#patch #-> 1 2 3 4 5);
		parameters: #(#rho);
		rho: 0.03;
		transitions: #(1 #-- #rho #--> 2 #'.' 2 #-- #rho #--> 3 #'.' 3 #-- #rho #--> 4 #'.' 4 #-- #rho #--> 5 #'.' 5 #-- #rho #--> 1 #'.').
	tmp6 := KendrickModel SEIRS.
	tmp6
		extends: 'SIR';
		parameters: #(#sigma #nu);
		delay: #(#sigma #, #S #-- #lambda #--> #I #, #E);
		addTransition: #(#R #-- #nu #--> #S #'.');
		addTransition: #(#E #-- #mu #--> #Empty #'.').
	tmp8 := Composition SEIRSInfluenza.
	tmp8
		model: 'Influenza';
		concern: 'Demographical';
		concern: 'Biological';
		concern: 'SEIRS';
		lambda: #(#beta #* #I_patch #/ #N #sum);
		N: #(#patch_species).
	tmp10 := Scenario SEIRSInfluenza1.
	tmp10
		on: 'SEIRSInfluenza';
		populationSize: 27500;
		nu: 0.00274;
		mu_species: #(3.65e-5 0.00137);
		sigma_species: #(0.5 0.67);
		gamma_species: #(0.25 0.233);
		rho_species: #(0.03 0.1);
		beta_species: #(#(0 0.21) #(0 0.42));
		S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
		I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).
	tmp12 := Simulation SEIRSInfluenzaRK rungeKutta.
	tmp12
		scenario: 'SEIRSInfluenza1';
		from: 0;
		to: 500;
		step: 1.
	tmp14 := Visualization SEIRSInfluenzaViz diagram.
	tmp14
		for: 'SEIRSInfluenzaRK';
		data: #(#I_species);
		legendTitle: 'Total of Infectious';
		legends: #('humans' 'birds');
		xLabel: 'Time (days)'