as yet unclassified
after

ModelComponent Infuenza.
	
KendrickModel Biological
	attribute: #(species -> human bird).
	
KendrickModel Demographical
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
	parameters: #(beta lambda gamma mu v);
	gamma: 0.25;
	v: 0.00274;
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		R -- v --> S.
	).	
		
KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	addTransition:	#(Empty -- mu --> S.);
	addTransition: #(status -- mu --> Empty.);
	delay: #(sigma , S -- lambda --> I  , E).
		
Composition MultiSpeciesSpatial
	populationSize: 27500;
	model: 'Demographical';
	model: 'Biological';
	model: 'SEIR';
	mu_species: #(0.0000365 0.00137);
	sigma_species: #(0.5 0.67);
	gamma_species: #(0.25 0.233);
	rho_species: #(0.03 0.1);
	beta_species: #(
		#(0 0.21)
		#(0 0.42)
	);
	lambda: #(beta*I_patch/N sum);
	N: #(patch_species);
	S_species_patch: #(
		#(500 500 500 500 500)
		#(4990 5000 5000 5000 5000)
	);
	I_species_patch: #(
		#(0 0 0 0 0)
		#(10 0 0 0 0)
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpeciesSpatial';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	for: 'SpatialRungeKutta';
	data: #(I_species);
	legendTitle: 'Total of Infectious';
	legends: #('humans' 'birds');
	xLabel: 'Time (days)'.