as yet unclassified
after

ModelComponent	Measles
	attribute: #(status -> S E I R);
	parameters: #(beta gamma mu sigma); 
	equations: #(
	   S:t=mu*N - beta*S*I - mu*S.
      E:t=beta*S*I - sigma*E - mu*E.
      I:t=sigma*E - gamma*I - mu*I.
      R:t=gamma*I - mu*R.
	);
	population: 100000;
	S: 99999;
	I: 1;
	others: 0;
	beta: 0.0000214;
	gamma: 0.143;
	mu: 0.0000351;
	sigma: 0.125.	
		
Simulation MeaslesRKSim rungeKutta
	forModel: 'Measles';
	from: 0.0; 
	to: 150; 
	step: 1.
	
Visualization MeaslesDiagramViz diagram 
	for: 'MeaslesRKSim';
	xLabel: 'Time (days)'.