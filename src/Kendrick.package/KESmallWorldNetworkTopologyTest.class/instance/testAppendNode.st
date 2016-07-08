as yet unclassified
testAppendNode
	|g tp|
	g := KEGraph nodes: 10.
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0.5}.
	tp applyOn: g.
	g nodes add: (KENode new label: #'11').
	tp appendNode: 11->g.

	self should: [ (g nodes at: 11) adjacentNodes size >= 0 ]