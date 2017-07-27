as yet unclassified
script
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 |
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
	tmp8 := KendrickModel SEIRSQ.
	tmp8
		extends: 'SEIRS';
		parameters: #(#delta #epsilon);
		addStatus: #(#Q);
		addTransition: #(#I #-- #delta #--> #Q #'.');
		addTransition: #(#Q #-- #epsilon #--> #R #'.');
		addTransition: #(#Q #-- #mu #--> #Empty #'.');
		lambda: #(#beta #* #I #/ #(#N #- #Q)).
	tmp10 := Composition SEIRSQInfluenza.
	tmp10
		model: 'Influenza';
		populationSize: 27500;
		concern: 'SEIRSQ';
		concern: 'Demographical';
		concern: 'Biological';
		lambda: #(#beta #* #(#I_patch #/ #(#N #- #Q_patch)) #sum);
		N: #(#species_patch).
	tmp12 := Scenario SEIRSQScenario1.
	tmp12
		on: 'SEIRSQInfluenza';
		beta_species: #(#(0 0.21) #(0 0.42));
		gamma_species: #(0.25 0.233);
		sigma_species: #(0.5 0.67);
		mu_species: #(3.65e-5 0.00137);
		nu: 0.00274;
		delta_species: #(0.068 0.055);
		epsilon_species: #(0.096 0.082);
		rho_species_Q: #(0.03 0.1 0);
		S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
		I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).
	tmp14 := Simulation SEIRSQInfluenzaRK rungeKutta.
	tmp14
		scenario: 'SEIRSQScenario1';
		from: 0;
		to: 500;
		step: 1.
	tmp16 := Visualization SEIRSQInfluenzaViz diagram.
	tmp16
		for: 'SEIRSQInfluenzaRK';
		data: #(#I_species);
		legendTitle: 'Total of Infectious';
		legends: #('humans' 'birds');
		xLabel: 'Time (days)'