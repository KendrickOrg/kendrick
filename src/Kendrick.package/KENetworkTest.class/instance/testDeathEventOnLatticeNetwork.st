tests
testDeathEventOnLatticeNetwork
	|model population network |
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status:[#S, #I, #R]}'.
	model population: population.
	model buildFromCompartments: {#status->#(S I R)} cardinalities: #(90 1 0).
	network := KENetwork on: population atAttribute: #status.
	network := network build: #lattice numberOfContacts: 4.
	population addGraph: network.
	self assert: ((network nodes at: 81) atContact: #S) equals: 3.
	model population removeIndividual: model population individuals last.
	
	self assert: (model population individuals last) isAlive equals: false.
	self assert: ((network nodes at: 81) atContact: #S) equals: 2
	