as yet unclassified
testApplyOn
	|g tp|
	g := KENetwork new.
	1 to: 10 do: [ :i| 
		g nodes add: (KENode new label: {#status->#S. #id->i})
		].
	tp := KERandomSmallWorldNetwork new K: 4; beta: 0.2.
	tp applyOn: g.
	
	self should: [(g nodes at: 1) adjacentNodes size >= 1]