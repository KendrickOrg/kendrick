as yet unclassified
testApplyOn
	| tmp1 tmp2 |
	tmp1 := KEGraph nodes: 10.
	tmp2 := KENetworkTopology
		new:
			{#scalefree.
			(#m0 -> 3)}.
	tmp2 applyOn: tmp1.
	self should: [ (tmp1 nodes at: 10) adjacentNodes size >= 0 ]