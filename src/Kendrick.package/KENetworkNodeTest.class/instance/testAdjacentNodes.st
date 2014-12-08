as yet unclassified
testAdjacentNodes
	|population nw node |
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R]}'.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->19. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	nw := KENetwork on: population atAttribute: #status.
	nw := nw build: #lattice numberOfContacts: 4.
	population addGraph: nw.
	node := nw nodes first.
	
	self assert: (node adjacentNodes size) equals: 2