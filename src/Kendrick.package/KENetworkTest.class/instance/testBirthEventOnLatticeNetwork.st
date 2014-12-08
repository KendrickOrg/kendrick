tests
testBirthEventOnLatticeNetwork
	|model population network ind|
	model := KEModel new.
	population := KEMetaPopulation new.
	population attributes: '{#status:[#S, #I, #R]}'.
	model population: population.
	model buildFromCompartments: {#status->#(S I R)} cardinalities: #(90 1 0).
	network := KENetwork on: population atAttribute: #status.
	network := network build: #lattice numberOfContacts: 4.
	population addGraph: network.
	ind := KEIndividual new currentStatus: (Dictionary newFrom: {#status->#I}).
	model population addIndividual: (ind).
	
	self assert: (network nodes size) equals: 92.
	self assert: (network nodes last atContact: #S) equals: 2.
	self assert: (network nodes last atContact: #I) equals: 0.
	self assert: (network nodes at: 92) adjacentNodes keys size equals: 2.
	self assert: ind position equals: #(2 10).
	