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
		Empty -- mu --> S.
	).	

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
		5 -- rho --> 1.).
		
KendrickModel SEIRS
	extends: 'SIR';
	parameters: #(sigma nu);
	delay: #(sigma , S -- lambda --> I  , E);
	addTransition:	#(R -- nu --> S.);
	addTransition: #(E -- mu --> Empty.).

KendrickModel SEIRSQ
	extends: 'SEIRS';
	parameters: #(delta epsilon);
	addStatus: #(Q);
	addTransition: #(I -- delta --> Q.);
	addTransition: #(Q -- epsilon --> R.);
	addTransition: #(Q -- mu --> Empty.);
	lambda: #(beta*I/(N-Q)).
	
Composition SEIRSQInfluenza
	populationSize: 27500;
	model: 'SEIRSQ';
	model: 'Demographical';
	model: 'Biological';
	lambda: #(beta*(I_patch/(N-Q_patch)) sum);
	N: #(species_patch).
	
Scenario SEIRSQScenario1
	on: 'SEIRSQInfluenza';
	beta_species: #(#(0 0.21) #(0 0.42));
	gamma_species: #(0.25 0.233);
	sigma_species: #(0.5 0.67);
	mu_species: #(0.0000365 0.00137);
	nu: 0.00274;		
	delta_species: #(0.068 0.055);
	epsilon_species: #(0.096 0.082);
	rho_species_Q: #(0.03 0.1 0);
	S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
	I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).

Simulation SEIRSQInfluenzaRK rungeKutta
	scenario: 'SEIRSQScenario1';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SEIRSQInfluenzaViz diagram 
	for: 'SEIRSQInfluenzaRK';
	data: #(I_species);
	legendTitle: 'Total of Infectious';
	legends: #('humans' 'birds');
	xLabel: 'Time (days)'.