as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 |
	tmp2 := KendrickModel SEIRS.
	tmp2
		attribute: #(#status #-> #S #E #I #R);
		parameters: #(#beta #lambda #gamma #mu #sigma #nu);
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #E #'.' #E #-- #sigma #--> #I #'.' #I #-- #gamma #--> #R #'.' #R #-- #nu #--> #S #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	KendrickModel Biological attribute: #(#species #-> #human #bird).
	tmp4 := KendrickModel Demographical.
	tmp4
		attribute: #(#country #-> #MyanmarBurma #Cambodia #Laos #Thailand #Vietnam);
		parameters: #(#rho);
		transitions: #(#Thailand #-- #rho #--> #Cambodia #'.' #Cambodia #-- #rho #--> #Vietnam #'.' #Vietnam #-- #rho #--> #Laos #'.' #Laos #-- #rho #--> #MyanmarBurma #'.' #MyanmarBurma #-- #rho #--> #Thailand #'.').
	tmp6 := KendrickModel SEIRSQ.
	tmp6
		extends: 'SEIRS';
		parameters: #(#delta #epsilon);
		addStatus: #(#Q);
		addTransition: #(#I #-- #delta #--> #Q #'.');
		addTransition: #(#Q #-- #epsilon #--> #R #'.');
		addTransition: #(#Q #-- #mu #--> #Empty #'.');
		lambda: #(#beta #* #I #/ #(#N #- #Q)).
	tmp8 := Composition SEIRSInfluenza.
	tmp8
		model: 'Influenza';
		concern: 'SEIRSQ';
		concern: 'Biological';
		lambda: #(#beta #* #(#I_country #/ #(#N #- #Q_country)) #sum).
	tmp10 := Composition SEIRSInfluenzaSpatial.
	tmp10
		extends: 'SEIRSInfluenza';
		concern: 'Demographical';
		N: #(#country_species).
	tmp12 := Scenario InfParameters1.
	tmp12
		on: 'SEIRSInfluenzaSpatial';
		populationSize: 27500;
		mu_species: #(0.000365 0.00137);
		beta_species_country: #(#(#(0 0.21) #(0 0.21) #(0 0.21) #(0 0.21) #(0 0.21)) #(#(0 0.28) #(0 0.28) #(0 0.28) #(0 0.42) #(0 0.28)));
		gamma_species: #(0.25 0.233);
		sigma_species: #(0.5 0.67);
		nu: 0.00274;
		rho_species_Q: #(0.03 0.1 0);
		delta_species: #(0.068 0.055);
		epsilon_species: #(0.096 0.082).
	tmp14 := Scenario InfPopDistribution1.
	tmp14
		on: 'SEIRSInfluenzaSpatial';
		S_species_country: #(#(500 500 500 500 500) #(5000 5000 5000 4990 5000));
		I_species_country: #(#(0 0 0 0 0) #(0 0 0 10 0)).
	tmp16 := Simulation SEIRSInfluenzaSim rungeKutta.
	tmp16
		scenarios: #(#InfParameters1 #InfPopDistribution1);
		from: 0.0;
		to: 500;
		step: 1.
	Visualization SEIRSInfluenzaAbstractViz map for: 'SEIRSInfluenzaSim'.
	tmp18 := Visualization SEIRSInfluenzaViz.
	tmp18
		extends: 'SEIRSInfluenzaAbstractViz';
		data: #(#country #I_bird_country #peakOfEpidemic)