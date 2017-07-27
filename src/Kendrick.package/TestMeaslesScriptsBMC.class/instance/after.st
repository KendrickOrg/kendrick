as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 |
	tmp2 := KendrickModel SIR.
	tmp2
		attribute: #(#status #-> #S #I #R);
		parameters: #(#beta #lambda #gamma #mu);
		transitions: #(#S #-- #lambda #--> #I #'.' #I #-- #gamma #--> #R #'.' #status #-- #mu #--> #Empty #'.' #Empty #-- #mu #--> #S #'.').
	tmp4 := KendrickModel SEIR.
	tmp4
		extends: 'SIR';
		parameters: #(#sigma);
		delay: #(#sigma #, #S #-- #lambda #--> #I #, #E).
	tmp6 := Composition Measles.
	tmp6
		model: 'Measles';
		concern: 'SEIR';
		lambda: #(#beta #* #I).
	tmp8 := Scenario MeaslesParameters.
	tmp8
		on: 'Measles';
		beta: 2.14e-5;
		gamma: 0.143;
		mu: 3.51e-5;
		sigma: 0.125.
	tmp10 := Scenario MeaslesPopulation.
	tmp10
		on: 'Measles';
		populationSize: 100000;
		S: 99999;
		I: 1;
		others: 0.
	tmp12 := Simulation MeaslesRKSim rungeKutta.
	tmp12
		scenarios: #(#MeaslesParameters #MeaslesPopulation);
		from: 0.0;
		to: 150;
		step: 1.
	tmp14 := Visualization MeaslesDiagramViz diagram.
	tmp14
		for: 'MeaslesRKSim';
		xLabel: 'Time (days)'