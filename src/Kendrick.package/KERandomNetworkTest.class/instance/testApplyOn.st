as yet unclassified
testApplyOn
	|g tp|
	g := KENetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomNetwork new p: 0.4.
	tp applyOn: g.

	self should: [(g nodes at: 1) adjacentNodes size >= 0]