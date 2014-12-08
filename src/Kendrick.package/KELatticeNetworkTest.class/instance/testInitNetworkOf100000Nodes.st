as yet unclassified
testInitNetworkOf100000Nodes
	|population nw|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R]}'.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->99999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	nw := KENetwork on: population atAttribute: #status.
	nw build: #lattice numberOfContacts: 4.
	
	self assert: (nw nodes size) equals: 100000.
	 