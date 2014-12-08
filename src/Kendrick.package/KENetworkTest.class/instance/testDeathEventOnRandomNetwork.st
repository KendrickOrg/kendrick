tests
testDeathEventOnRandomNetwork
	|model population network  |
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status:[#S, #I, #R]}'.
	model population: population.
	model buildFromCompartments: {#status->#(S I R)} cardinalities: #(90 1 0).
	network := KENetwork on: population atAttribute: #status.
	network := network build: #random numberOfContacts: 4.
	population addGraph: network.
	model population removeIndividual: model population individuals last.
	
	self assert: (model population individuals last) isAlive equals: false.
	