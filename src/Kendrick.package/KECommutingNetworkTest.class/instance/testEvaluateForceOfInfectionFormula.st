as yet unclassified
testEvaluateForceOfInfectionFormula
	|model network rs|
	model := KEModel new.
	model population: self createMetaPopulationForTesting.
	network := KECommutingNetwork newOn: model population atAttribute: #patch.
	network 
		edges: { 1->2. 2->3. 3->4. 5->5 };
		leaveRatesOfAllConnections: 0.1;
		returnRatesOfAllConnections: 2.
	model currentCompartment: (Dictionary newFrom: {#status->#S. #patch->2}).
	model addParameter: #beta value: 1.
	rs := network evaluateForceOfInfection: model formula: 'beta*I' parseAsAnExpression.
	