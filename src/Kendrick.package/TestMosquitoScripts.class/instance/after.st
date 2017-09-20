accessing
after

ModelComponent Mosquito
	population: 4000;
	attribute: #(status -> S I R); 
	parameters: #(mu gamma beta lambda rho);
	mu: 12.17;
	gamma: 52;
	beta: 1;
	lambda: #(beta*I);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).

KendrickModel SpeciesConcern
	attribute: #(species -> mosquito reservoir1 reservoir2).
		
Composition MultiMosquito
	model: 'Mosquito';
	concern: 'SpeciesConcern';	
	S_species: #(999 1000 2000);
	I_species: #(1 0 0);
	"others: 0;"
	N: #(species);
	mu_species: #(12.17 0.05 0.05);
	rho_species: #(
		#(0 0.02 0.02) 
		#(0.02 0 0) 
		#(0.02 0 0)
	);
	lambda: #(beta*rho*I sum).

Simulation MosquitoGillepsie gillespie
	for: 'MultiMosquito';
	from: 0.0; 
	to: 0.5; 
	step: 0.0027.
	
Visualization MosquitoDiagramViz diagram 
	for: 'MosquitoGillepsie';
	data: #(I sqrt);
	xLabel: 'Time (days)'.