as yet unclassified
script
	
KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.).

KendrickModel Biological
	attribute: #(species -> human bird).
	
Composition SIRInfluenza
	model: 'Influenza';
	populationSize: 5500;
	concern: 'Biological';
	concern: 'SIR';
	lambda: #(beta*I/N sum);
	N: #(species).
	
Scenario SIRInfluenza1
	on: 'SIRInfluenza';
	mu_species: #(0.0000365 0.00137);
	gamma_species: #(0.25 0.233);
	beta_species: #(#(0 0.21) #(0 0.42));
	S_species: #(500 4990);
	I_species: #(0 10).
	
Simulation SIRInfluenzaRK rungeKutta
	scenario: 'SIRInfluenza1';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SIRInfluenzaViz diagram 
	for: 'SIRInfluenzaRK';
	xLabel: 'Time (days)'.