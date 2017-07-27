as yet unclassified
testAppendNode
	| tmp1 tmp2 |
	tmp1 := KEGraph nodes: 10.
	tmp2 := KENetworkTopology
		new:
			{#smallworld.
			(#K -> 4).
			(#beta -> 0.5)}.
	tmp2 applyOn: tmp1.
	tmp1 nodes add: (KENode new label: #'11').
	tmp2 appendNode: 11 -> tmp1.
	self should: [ (tmp1 nodes at: 11) adjacentNodes size >= 0 ]