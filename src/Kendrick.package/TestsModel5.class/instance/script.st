as yet unclassified
script
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 |
	ModelComponent Influenza.
	tmp2 := KendrickModel SIR.
	tmp2
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu);
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	tmp4 := KendrickModel SEIRS.
	tmp4
		extends: 'SIR';
		parameters: #(#sigma #nu);
		delay: #(#sigma #, #S #-- #lambda #--> #I #, #E);
		addTransition: #(#R #-- #nu #--> #S #'.');
		addTransition: #(#E #-- #mu #--> #Empty #'.').
	tmp6 := KendrickModel SEIIRS.
	tmp6
		extends: 'SEIRS';
		parameters: #(#beta1 #beta2);
		splitStatus: #(#I #strains #(1 2)).
	KendrickModel Biological attribute: #(#species #-> #human #bird).
	tmp8 := KendrickModel Demographical.
	tmp8
		attribute: #(#patch #-> 1 2 3 4 5);
		parameters: #(#rho);
		rho: 0.03;
		transitions: #(1 #-- #rho #--> 2 #'.' 2 #-- #rho #--> 3 #'.' 3 #-- #rho #--> 4 #'.' 4 #-- #rho #--> 5 #'.' 5 #-- #rho #--> 1 #'.').
	tmp10 := Composition SEIIRSCombo.
	tmp10
		model: 'Influenza';
		populationSize: 27500;
		concern: 'SEIIRS';
		concern: 'Demographical';
		concern: 'Biological';
		beta1_species: #(#(0 0.21) #(0 0.42));
		beta2_species: #(#(0 0.021) #(0 0.042));
		lambda: #(#beta1 #* #(#I1_patch #/ #N) #+ #beta2 #* #(#I2_patch #/ #N) #sum);
		gamma_species_status: #(#(0 0 0.25 0.0025 0 0) #';' #(0 0 0.233 0.0023 0 0) #';');
		sigma_species_status: #(#(0 0 0.5 0.005 0 0) #';' #(0 0 0.67 0.0067 0) #';');
		mu_species: #(3.65e-5 0.00137);
		N: #(#species_patch);
		nu: 0.00274;
		rho_species: #(0.03 0.1 0);
		S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
		I1_species_patch: #(#(0 0 0 0 0) #(9 0 0 0 0));
		I2_species_patch: #(#(0 0 0 0 0) #(1 0 0 0 0)).
	tmp12 := Simulation SEIIRSInfluenzaRK rungeKutta.
	tmp12
		for: 'SEIIRSCombo';
		from: 0;
		to: 500;
		step: 1.
	tmp14 := Visualization SEIIRSInfluenzaViz diagram.
	tmp14
		for: 'SEIIRSInfluenzaRK';
		data: #(#I2_species);
		legendTitle: 'Total of Infectious';
		legends: #('birds strains 1' 'humans strains 1' 'birds strains 2' 'humans strains 2');
		xLabel: 'Time (days)'