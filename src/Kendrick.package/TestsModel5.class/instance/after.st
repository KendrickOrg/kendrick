as yet unclassified
after

KendrickModel SEIRS
    attribute: #(status -> S E I R);
    parameters: #(beta lambda gamma mu sigma nu);
    lambda: #(beta*I/N);
    transitions: #(
        S -- lambda --> E.
        E -- sigma --> I.
        I -- gamma --> R.
        R -- nu --> S.
        status -- mu --> Empty.
        Empty -- mu --> S.).

KendrickModel SEIIRS
	extends: 'SEIRS';
	parameters: #(beta1 beta2);
	splitStatus: #(I index #(1 2)).

KendrickModel Biological
	attribute: #(species -> human bird).
	
KendrickModel Demographical
	attribute: #(patch -> 1  2  3  4  5);
	parameters: #(rho);
	transitions: #(
		1 -- rho --> 2.
		2 -- rho --> 3.
		3 -- rho --> 4.
		4 -- rho --> 5.
		5 -- rho --> 1.).
	
Composition SEIIRSCombo
	model: 'Influenza';
	concern: 'SEIIRS';
	concern: 'Demographical';
	concern: 'Biological';
	lambda: #((beta1*(I1_patch/N))+(beta2*(I2_patch/N)) sum);
	N: #(patch_species).
	
Scenario InfuenzaScenario1
	on: 'SEIIRSCombo';
	populationSize: 27500;
	beta1_species: #(#(0 0.21) #(0 0.42));
	beta2_species: #(#(0 0.021) #(0 0.042));
	nu: 0.00274;		
	rho_species: #(0.03 0.1);
	gamma_species_status: #(
		#(0 0 0 0 0.25 0.0025)
		#(0 0 0 0 0.233 0.0023)
	);
	sigma_species_status_next: #(
		#(0 0 0 0 0.5 0.005)
		#(0 0 0 0 0.67 0.0067)
	);
	S_species_patch: #(#(500 500 500 500 500) #(4990 5000 5000 5000 5000));
	I1_species_patch: #(#(0 0 0 0 0) #(9 0 0 0 0));
	I2_species_patch: #(#(0 0 0 0 0) #(1 0 0 0 0));
	mu_species: #(0.000365 0.00137).

Simulation SEIIRSInfluenzaRK rungeKutta
	scenario: 'InfuenzaScenario1';
	from: 0.0; 
	to: 500; 
	step: 1.
	
Visualization SEIIRSInfluenzaViz diagram 
	for: 'SEIIRSInfluenzaRK';
	data: #(I1_species I2_species); "I2_Species"
	legendTitle: 'Total of Infectious';
	legends: #('birds strains 1' 'humans strains 1' 'birds strains 2' 'humans strains 2');
	xLabel: 'Time (days)'.