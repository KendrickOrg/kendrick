as yet unclassified
afterBench
	| tmp2 tmp4 tmp6 tmp8 tmp10 |
	ModelComponent OneSpeciesSpatial population: 5000.
	tmp2 := KendrickModel Spatial.
	tmp2
		attribute: #(#patch #-> 1 2 3 4 5);
		parameters: #(#rho);
		rho: 0.03;
		transitions: #(1 #-- #rho #--> 2 #'.' 2 #-- #rho #--> 3 #'.' 3 #-- #rho #--> 4 #'.' 4 #-- #rho #--> 5 #'.' 5 #-- #rho #--> 1 #'.').
	tmp4 := KendrickModel SIR.
	tmp4
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #sigma #gamma #mu);
		mu: 3.65e-5;
		gamma: 0.25;
		lambda: #(#beta #* #I #/ #N);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.').
	tmp6 := KendrickModel SEIR.
	tmp6
		extends: 'SIR';
		parameters: #(#sigma);
		sigma: 0.5;
		delay: #(#sigma #, #S #-- #lambda #--> #I #, #E).
	tmp8 := Composition OneSpatialCombo.
	tmp8
		model: 'OneSpeciesSpatial';
		concern: 'Spatial';
		concern: 'SEIR';
		beta_patch: #(0.75 0.5 0.5 0.5 0.5);
		N: #(#patch);
		lambda: #(#beta #* #I_patch #/ #N);
		S_patch: #(900 1000 1000 1000 1000);
		I_patch: #(100 0 0 0 0).
	tmp10 := Simulation SpatialRungeKutta rungeKutta.
	tmp10
		for: 'OneSpatialCombo';
		from: 0;
		to: 500;
		step: 1;
		init;
		execute