as yet unclassified
after
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 |
	tmp2 := KendrickModel SEIR.
	tmp2
		attribute: #(#status #-> #S #E #I #R);
		parameters: #(#beta #sigma #gamma #mu);
		equations: #(#S: #t #= #mu #* #N #- #beta #* #S #* #I #- #mu #* #S #'.' #E: #t #= #beta #* #S #* #I #- #sigma #* #E #- #mu #* #E #'.' #I: #t #= #sigma #* #E #- #gamma #* #I #- #mu #* #I #'.' #R: #t #= #gamma #* #I #- #mu #* #R #'.').
	tmp4 := Composition Measles.
	tmp4
		model: 'Measles';
		concern: 'SEIR'.
	tmp6 := Scenario MeaslesParameters.
	tmp6
		on: 'Measles';
		beta: 2.14e-5;
		gamma: 0.143;
		mu: 3.51e-5;
		sigma: 0.125.
	tmp8 := Scenario MeaslesPopulation.
	tmp8
		on: 'Measles';
		populationSize: 100000;
		S: 99999;
		I: 1;
		others: 0.
	tmp10 := Simulation MeaslesRKSim rungeKutta.
	tmp10
		scenarios: #(#MeaslesParameters #MeaslesPopulation);
		from: 0.0;
		to: 150;
		step: 1.
	tmp12 := Visualization MeaslesDiagramViz diagram.
	tmp12
		for: 'MeaslesRKSim';
		xLabel: 'Time (days)'