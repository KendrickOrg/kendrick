as yet unclassified
after

ModelComponent OneSpeciesSpatial	
	population: 5000.

KendrickModel Spatial
	attribute: #(patch -> 1  2  3  4  5);
	parameters: #(rho);
	rho: 0.03;
	transitions: #(
		1 -- rho --> 2.
		2 -- rho --> 3.
		3 -- rho --> 4.
		4 -- rho --> 5.
		5 -- rho --> 1.
	).
		
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda sigma gamma mu);
	mu: 0.0000365;
	gamma: 0.25;
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
	).

KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	sigma: 0.5;
	delay: #(sigma , S -- lambda --> I  , E).
	
Composition OneSpatialCombo
	model: 'OneSpeciesSpatial';
	concern: 'Spatial';
	concern: 'SEIR';
	beta_patch: #(0.75 0.5 0.5 0.5 0.5);
	N: #(patch);
	lambda: #(beta*I_patch/N); "check how this should work"
	S_patch: #(900 1000 1000 1000 1000);
	I_patch: #(100 0 0 0 0).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'OneSpatialCombo';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	for: 'SpatialRungeKutta';
	data: #(I_patch);
	legends: #('patch 1' 'patch 2' 'patch 3' 'patch 4' 'patch 5');
	legendTitle: 'Infectious';
	xLabel: 'Time (days)'.