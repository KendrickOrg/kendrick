as yet unclassified
after
	| tmp2 tmp4 tmp6 |
	tmp2 := ModelComponent Measles.
	tmp2
		attribute: #(#status #-> #S #E #I #R);
		parameters: #(#beta #gamma #mu #sigma);
		equations: #(#S: #t #= #mu #* #N #- #beta #* #S #* #I #- #mu #* #S #'.' #E: #t #= #beta #* #S #* #I #- #sigma #* #E #- #mu #* #E #'.' #I: #t #= #sigma #* #E #- #gamma #* #I #- #mu #* #I #'.' #R: #t #= #gamma #* #I #- #mu #* #R #'.');
		population: 100000;
		S: 99999;
		I: 1;
		others: 0;
		beta: 2.14e-5;
		gamma: 0.143;
		mu: 3.51e-5;
		sigma: 0.125.
	tmp4 := Simulation MeaslesRKSim rungeKutta.
	tmp4
		forModel: 'Measles';
		from: 0.0;
		to: 150;
		step: 1.
	tmp6 := Visualization MeaslesDiagramViz diagram.
	tmp6
		for: 'MeaslesRKSim';
		xLabel: 'Time (days)'