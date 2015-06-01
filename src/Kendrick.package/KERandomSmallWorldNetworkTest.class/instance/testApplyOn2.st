as yet unclassified
testApplyOn2
	|g tp|
	g := KENetwork new.
	1 to: 15 do: [ :i| 
		g nodes add: (KENode new label: {#region->i})
		].
	tp := KERandomSmallWorldNetwork new K: 4; beta: 0.
	tp applyOn: g.

	self assert: (g nodes at: 1) adjacentNodes size equals: 4