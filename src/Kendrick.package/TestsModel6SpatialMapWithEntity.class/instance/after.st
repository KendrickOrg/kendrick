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

KendrickModel Biological
    attribute: #(species -> human bird).

Map IndoChina
	for: #(country -> MyanmarBurma Cambodia Laos Thailand Vietnam);
	borders: #(
   		#(0 0 0 1 0)
      #(0 0 0 0 1)
      #(1 0 0 0 0)
      #(0 1 0 0 0)
      #(0 0 1 0 0)
   ).
	
KendrickModel Demographical
	 maps: 'IndoChina';
	 withTransitionRate: #(rho).
	    
KendrickModel SEIRSQ
    extends: 'SEIRS';
    parameters: #(delta epsilon);
    addStatus: #(Q);
    addTransition: #(I -- delta --> Q.);
    addTransition: #(Q -- epsilon --> R.);
    addTransition: #(Q -- mu --> Empty.);
    lambda: #(beta*I/(N-Q)).

Composition SEIRSInfluenza
    model: 'Influenza';
    concern: 'SEIRSQ';
    concern: 'Biological';
    lambda: #(beta*(I_country/(N-Q_country)) sum).

Composition SEIRSInfluenzaSpatial
   extends: 'SEIRSInfluenza';
	concern: 'Demographical';	 
	N: #(country_species).

Scenario InfParameters1
	on: 'SEIRSInfluenzaSpatial';
   populationSize: 27500;
   mu_species: #(0.000365 0.00137);
   beta_species_country: #(
			#(#(0 0.21) #(0 0.21) #(0 0.21) #(0 0.21) #(0 0.21))
			#(#(0 0.28) #(0 0.28) #(0 0.28) #(0 0.42) #(0 0.28))
	);
   gamma_species: #(0.25 0.233);
   sigma_species: #(0.5 0.67);
   nu: 0.00274;
   rho_species_Q: #(0.03 0.1 0);
   delta_species: #(0.068 0.055);
   epsilon_species: #(0.096 0.082).

Scenario InfPopDistribution1
   on: 'SEIRSInfluenzaSpatial';
   S_species_country: #(#(500 500 500 500 500) #(5000 5000 5000 4990 5000));
   I_species_country: #(#(0 0 0 0 0) #(0 0 0 10 0)).

Simulation SEIRSInfluenzaSim rungeKutta
    scenarios: #(InfParameters1 InfPopDistribution1);
    from: 0.0;
    to: 500;
    step: 1.

Visualization SEIRSInfluenzaAbstractViz map
    for: 'SEIRSInfluenzaSim'.

Visualization SEIRSInfluenzaViz
	extends: 'SEIRSInfluenzaAbstractViz';
   data: #(country I_bird_country peakOfEpidemic).
