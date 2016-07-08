as yet unclassified
testUpdateNodeOf
	|g tp|
	g := KEContactNetwork_Old new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KEERRandomNetworkTopology new p: 0.4.
	g topology: tp.
	tp applyOn: g.
	g updateNodeOf: (KEIndividual new nextStatus: (Dictionary newFrom: {#status->#I}); id: 1).
	self should: [(g nodes at: 1) label includes: #status->#I]