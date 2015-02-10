as yet unclassified
testInitNetwork
	|population nw|
	population := KEMetaPopulation new.
	population attributes: '{#status: [#S, #I, #R]}'.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->19. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	nw := KENetwork on: population atAttribute: #status.
	nw buildNetworkType: #lattice numberOfContacts: 4.

	self assert: (nw nodes size) equals: 20.
	self assert: (nw nodes at: 1) adjacentNodes keys size equals: 2. 
	self assert: (nw nodes at: 2) adjacentNodes keys size equals: 3.
	self assert: (nw nodes at: 3) adjacentNodes keys size equals: 3.
	self assert: (nw nodes at: 4) adjacentNodes keys size equals: 2.
	self assert: (nw nodes at: 5) adjacentNodes keys size equals: 3.
	self assert: (nw population individuals at: 1) position equals: #(1 1).
	self assert: (nw population individuals at: 2) position equals: #(2 1).
	self assert: (nw population individuals at: 4) position equals: #(4 1).
	self assert: (nw population individuals at: 8) position equals: #(4 2).
	self assert: (nw population individuals at: 5) position equals: #(1 2).