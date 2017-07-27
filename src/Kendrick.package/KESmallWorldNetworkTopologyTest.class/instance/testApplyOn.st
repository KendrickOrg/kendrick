as yet unclassified
testApplyOn
	| tmp1 tmp2 |
	tmp1 := KEGraph
		nodes: #(#A #B #C #D #E #F #G #H #I #J #K #L #M #N #O).
	tmp2 := KENetworkTopology
		new:
			{#smallworld.
			(#K -> 4).
			(#beta -> 0.2)}.
	tmp2 applyOn: tmp1.
	self should: [ (tmp1 nodes at: 1) adjacentNodes size >= 1 ]