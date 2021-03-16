Class {
	#name : #TestsModel3,
	#superclass : #TestsIST,
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
TestsModel3 >> script [

KModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	lambda: #(beta*I/N);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.).

KModel Biological
	attribute: #(species -> human bird).
	
KModel Demographical
	attribute: #(patch -> 1  2  3  4  5);
	parameters: #(rho);
	rho: 0.03;
	transitions: #(
		1 -- rho --> 2.
		2 -- rho --> 3.
		3 -- rho --> 4.
		4 -- rho --> 5.
		5 -- rho --> 1.).
		
KModel SEIRS
	extends: 'SIR';
	parameters: #(sigma nu);
	delay: #(sigma , S -- lambda --> I  , E);
	addTransition:	#(R -- nu --> S.);
	addTransition: #(E -- mu --> Empty.).
		
Composition SEIRSInfluenza
	model: 'Demographical';
	model: 'Biological';
	model: 'SEIRS';
	lambda: #(beta*I_patch/N sum);
	N: #(patch_species).
	
Scenario SEIRSInfluenza1
	on: 'SEIRSInfluenza';
	populationSize: 27500;
	nu: 0.00274;
	mu_species: #(0.0000365 0.00137);
	sigma_species: #(0.5 0.67);
	gamma_species: #(0.25 0.233);
	rho_species: #(0.03 0.1);
	beta_species: #(#(0 0.21) #(0 0.42));
	S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
	I_species_patch: #(#(0 0 0 0 0) #(10 0 0 0 0)).
		
Simulation SEIRSInfluenzaRK rungeKutta
	scenario: 'SEIRSInfluenza1';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SEIRSInfluenzaViz chart  
	for: 'SEIRSInfluenzaRK';
	data: #(I_species);
	legendTitle: 'Total of Infectious';
	legends: #('humans' 'birds');
	xLabel: 'Time (days)'.
]

{ #category : #'as yet unclassified' }
TestsModel3 >> vizId [

	^ 'SEIRSInfluenzaViz'
]
