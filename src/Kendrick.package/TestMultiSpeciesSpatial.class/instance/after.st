as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 tmp10 |
	ModelComponent MultiSpeciesSpatial population: 27500.
	KendrickModel MultiHost attribute: #(#species #-> #human #bird).
	tmp2 := KendrickModel Spatial.
	tmp2
		attribute: #(#patch #-> 1 2 3 4 5);
		parameters: #(#rho);
		rho: 0.03;
		transitions: #(1 #-- #rho #--> 2 #'.' 2 #-- #rho #--> 3 #'.' 3 #-- #rho #--> 4 #'.' 4 #-- #rho #--> 5 #'.' 5 #-- #rho #--> 1 #'.').
	tmp4 := KendrickModel Epidemiological.
	tmp4
		attribute: #(#status #-> #S #E #I #R);
		parameters: #(#beta #lambda #sigma #gamma #v #mu);
		v: 0.00274;
		gamma: 0.25;
		transitions: #(#S #-- #lambda #--> #E #'.' #E #-- #sigma #--> #I #'.' #I #-- #gamma #--> #R #'.' #R #-- #v #--> #S #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	tmp6 := Composition MultiSpatialCombo.
	tmp6
		model: 'MultiSpeciesSpatial';
		concern: 'Spatial';
		concern: 'MultiHost';
		concern: 'Epidemiological';
		mu_species: #(3.65e-5 0.00137);
		sigma_species: #(0.5 0.67);
		gamma_species: #(0.25 0.233);
		N: #(#patch_species);
		rho_species: #(0.03 0.1);
		beta_species: #(#(0 0.21) #(0 0.42));
		lambda: #(#beta #* #I_patch #/ #N #sum);
		S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
		I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).
	tmp8 := Simulation SpatialRungeKutta rungeKutta.
	tmp8
		for: 'MultiSpatialCombo';
		from: 0;
		to: 500;
		step: 1.
	tmp10 := Visualization SpatialDiagramViz diagram.
	tmp10
		for: 'SpatialRungeKutta';
		data: #(#I_species);
		legendTitle: 'Total of Infectious';
		legends: #('humans' 'birds');
		xLabel: 'Time (days)'