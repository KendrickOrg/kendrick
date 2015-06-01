as yet unclassified
testApplyOn
	|g tp|
	g := KENetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomSmallWorldNetwork new K: 4; beta: 0.
	tp applyOn: g.

	self assert: (g nodes at: 1) adjacentNodes size equals: 4