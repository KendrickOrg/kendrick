as yet unclassified
testCreateNodeOf
	|g tp|
	g := KEContactNetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomNetwork new p: 0.4.
	g topology: tp.
	tp applyOn: g.
	g createNodeOf: (KEIndividual new currentStatus: (Dictionary newFrom: {#status->#S}); id: 11).
	self should: [(g nodes at: 11) adjacentNodes size >= 0]