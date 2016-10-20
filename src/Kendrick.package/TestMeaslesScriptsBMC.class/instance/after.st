as yet unclassified
after

KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).	
    
KendrickModel SEIR
	extends: 'SIR';
	parameters: #(sigma);
	delay: #(sigma , S -- lambda --> I  , E).
    
Composition Measles
    model: 'Measles';
    concern: 'SEIR';
    lambda: #(beta*I).
    
Scenario MeaslesParameters
	 on: 'Measles';
    beta: 0.0000214; 
    gamma: 0.143; 
    mu: 0.0000351; 
    sigma: 0.125.
    
Scenario MeaslesPopulation
    on: 'Measles';
    populationSize: 100000;
    S: 99999;
    I: 1;
    others: 0.
    
Simulation MeaslesRKSim rungeKutta
	scenarios: #(MeaslesParameters MeaslesPopulation);
	from: 0.0; 
	to: 150; 
	step: 1.
	
Visualization MeaslesDiagramViz diagram 
	for: 'MeaslesRKSim';
	xLabel: 'Time (days)'.