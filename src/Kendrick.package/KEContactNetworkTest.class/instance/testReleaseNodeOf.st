as yet unclassified
testReleaseNodeOf
	|g tp|
	g := KEContactNetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomNetwork new p: 0.4.
	g topology: tp.
	tp applyOn: g.
	g releaseNodeOf: (KEIndividual new currentStatus: (Dictionary newFrom: {#status->#S}); id: 9).
	self should: [(g nodes at: 9) adjacentNodes size = 0].
	self should: [ (tp activeNodes includes: 9) not ]