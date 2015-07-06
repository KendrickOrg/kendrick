as yet unclassified
testEffectiveSizeOfPopulation
	|population network source s|
	population := self createMetaPopulationForTesting.
	network := KECommutingNetwork newOn: population atAttribute: #patch.
	network 
		edges: { 1->2. 2->3. 3->4. 5->5 };
		leaveRatesOfAllConnections: 0.1;
		returnRatesOfAllConnections: 2.
	source := Dictionary newFrom: { #status->#S. #patch->1 }.
	s := network effectiveSizeOf: source population: population.

	self should: [ (s > 997.835) & (s < 1000) ]