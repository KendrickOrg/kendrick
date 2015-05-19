as yet unclassified
testAppendNode
	|g tp|
	g := KENetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomScaleFreeNetwork new m0: 3.
	tp applyOn: g.
	g nodes add: (KENode new label: {#status->#S. #id->11}).
	tp appendNode: ((g nodes at: 11) label->11).

	self should: [ (g nodes at: 11) adjacentNodes size >= 0 ]