as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 |
	ModelComponent Infuenza.
	KendrickModel Biological attribute: #(#species #-> #human #bird).
	tmp2 := KendrickModel Demographical.
	tmp2
		attribute: #(#patch #-> 1 2 3 4 5);
		parameters: #(#rho);
		rho: 0.03;
		transitions: #(1 #-- #rho #--> 2 #'.' 2 #-- #rho #--> 3 #'.' 3 #-- #rho #--> 4 #'.' 4 #-- #rho #--> 5 #'.' 5 #-- #rho #--> 1 #'.').
	tmp4 := KendrickModel SIR.
	tmp4
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu #v);
		gamma: 0.25;
		v: 0.00274;
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #R #-- #v #--> #S #'.').
	tmp6 := KendrickModel SEIR.
	tmp6
		extends: 'SIR';
		parameters: #(#sigma);
		addTransition: #(#Empty #-- #mu #--> #S #'.');
		addTransition: #(#status #-- #mu #--> #Empty #'.');
		delay: #(#sigma #, #S #-- #lambda #--> #I #, #E).
	tmp8 := Composition MultiSpeciesSpatial.
	tmp8
		model: 'Infuenza';
		populationSize: 27500;
		concern: 'Demographical';
		concern: 'Biological';
		concern: 'SEIR';
		mu_species: #(3.65e-5 0.00137);
		sigma_species: #(0.5 0.67);
		gamma_species: #(0.25 0.233);
		rho_species: #(0.03 0.1);
		beta_species: #(#(0 0.21) #(0 0.42));
		lambda: #(#beta #* #I_patch #/ #N #sum);
		N: #(#patch_species);
		S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
		I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).
	tmp10 := Simulation SpatialRungeKutta rungeKutta.
	tmp10
		for: 'MultiSpeciesSpatial';
		from: 0;
		to: 500;
		step: 1.
	tmp12 := Visualization SpatialDiagramViz diagram.
	tmp12
		for: 'SpatialRungeKutta';
		data: #(#I_species);
		legendTitle: 'Total of Infectious';
		legends: #('humans' 'birds');
		xLabel: 'Time (days)'