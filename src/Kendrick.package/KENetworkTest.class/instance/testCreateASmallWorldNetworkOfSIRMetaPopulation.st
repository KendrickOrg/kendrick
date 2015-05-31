tests
testCreateASmallWorldNetworkOfSIRMetaPopulation
	|model population  network |
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status:[#S, #I, #R], #region: [#A, #B, #C, #D, #E, #F, #G, #H, #I, #J, #K, #L, #M, #N, #O, #P]}'.
	model population: population.
	model buildFromCompartments: {#region->#(A B C D E F G H I J K L M N O P). #status->#(S I R)} cardinalities: #(100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0 100 10 0).
	network := KENetwork on: population atAttribute: #region.
	network := network buildNetworkType: #smallworld numberOfContacts: 4.
	
	self assert: network nodes size equals: 16