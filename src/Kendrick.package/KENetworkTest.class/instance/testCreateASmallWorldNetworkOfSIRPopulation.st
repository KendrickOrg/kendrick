tests
testCreateASmallWorldNetworkOfSIRPopulation
	|model population network |
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status:[#S, #I, #R]}'.
	model population: population.
	model buildFromCompartments: {#status->#(S I R)} cardinalities: #(99999 1 0).
	network := KENetwork on: population atAttribute: #status.
	network := network build: #smallworld numberOfContacts: 4.
	
	self assert: network nodes size equals: 100000