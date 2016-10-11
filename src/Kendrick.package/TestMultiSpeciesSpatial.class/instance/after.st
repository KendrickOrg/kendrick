as yet unclassified
after

ModelComponent MultiSpeciesSpatial	
	population: 27500.
	
KendrickModel MultiHost
	attribute: #(species -> human bird).
	"parameters: #(delta)."
	
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
		
KendrickModel Epidemiological
	attribute: #(status -> S  E  I  R);
	parameters: #(beta lambda sigma gamma v mu);
	v: 0.00274;
	"mu: 0.0000365;"
	"sigma: 0.5;"
	gamma: 0.25;
	"beta: 1;"
	"lambda: #(beta*I/N);"
	transitions: #(
		S -- lambda --> E.
		E -- sigma --> I.
		I -- gamma --> R.
		R -- v --> S.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).
		
Composition MultiSpatialCombo
	model: 'MultiSpeciesSpatial';
	concern: 'Spatial';
	concern: 'MultiHost';
	concern: 'Epidemiological';
	"beta_patch: #(0.75 0.5 0.5 0.5 0.5);"
	mu_species: #(0.0000365 0.00137);
	sigma_species: #(0.5 0.67);
	gamma_species: #(0.25 0.233);
	N: #(patch_species);
	rho_species: #(0.03 0.1);
	beta_species: #(
		#(0 0.21)
		#(0 0.42)
	);
	"delta_species: #(
		#(0 0.21)
		#(0 0.42)
	);"
	lambda: #(beta*I_patch/N sum); "check how this should work"
	S_species_patch: #(
		#(500 500 500 500 500)
		#(4990 5000 5000 5000 5000)
	);
	I_species_patch: #(
		#(0 0 0 0 0)
		#(10 0 0 0 0)
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpatialCombo';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	for: 'SpatialRungeKutta';
	data: #(I_species);"seems to be need some more handling here"
	legendTitle: 'Total of Infectious';
	legends: #('humans' 'birds');
	xLabel: 'Time (days)'.