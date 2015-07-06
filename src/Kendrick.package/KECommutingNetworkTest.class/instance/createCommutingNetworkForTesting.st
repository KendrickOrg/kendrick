as yet unclassified
createCommutingNetworkForTesting
	|population network|
	population := KEMetaPopulation new.
	population attributes: { #status->#(S I). #patch->(1 to: 5) }.
	population compartments: '{
		{ #status: #S, #patch: 1 }: 800,
		{ #status: #I, #patch: 1 }: 200,
		{ #status: #S, #patch: 2 }: 1000,
		{ #status: #I, #patch: 2 }: 0,
		{ #status: #S, #patch: 3 }: 1000,
		{ #status: #I, #patch: 3 }: 0,
		{ #status: #S, #patch: 4 }: 1000,
		{ #status: #I, #patch: 4 }: 0,
		{ #status: #S, #patch: 5 }: 1000,
		{ #status: #I, #patch: 5 }: 0
	}'.
	network := KECommutingNetwork newOn: population atAttribute: #patch.
	network 
		edges: { 1->2. 2->3. 3->4. 5->5 };
		leaveRatesOfAllConnections: 0.1;
		returnRatesOfAllConnections: 2.
	^ network