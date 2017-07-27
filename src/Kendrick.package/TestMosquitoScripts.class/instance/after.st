as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 |
	tmp2 := ModelComponent Mosquito.
	tmp2
		population: 13000;
		attribute: #(#status #-> #S #I #R);
		parameters: #(#mu #gamma #beta #lambda #rho);
		mu: 12.17;
		gamma: 52;
		beta: 1;
		lambda: #(#beta #* #I);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	KendrickModel SpeciesConcern
		attribute: #(#species #-> #mosquito #reservoir1 #reservoir2).
	tmp4 := Composition MultiMosquito.
	tmp4
		model: 'Mosquito';
		concern: 'SpeciesConcern';
		S_species: #(9999 1000 2000);
		I_species: #(1 0 0);
		N: #(#species);
		mu_species: #(12.17 0.05 0.05);
		rho_species: #(#(0 0.02 0.02) #(0.02 0 0) #(0.02 0 0));
		lambda: #(#beta #* #rho #* #I #sum).
	tmp6 := Simulation MosquitoGillepsie gillespie.
	tmp6
		for: 'MultiMosquito';
		from: 0.0;
		to: 0.5;
		step: 0.0027.
	tmp8 := Visualization MosquitoDiagramViz diagram.
	tmp8
		for: 'MosquitoGillepsie';
		data: #(#I #sqrt);
		xLabel: 'Time (days)'