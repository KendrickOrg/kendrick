as yet unclassified
testApplyOn
	|g tp|
	g := KENetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomScaleFreeNetwork new m0: 3.
	tp applyOn: g.

	self should: [ (g nodes at: 1) adjacentNodes size >= 3]