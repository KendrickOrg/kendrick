as yet unclassified
testApplyOn2
	| tmp1 tmp2 |
	tmp1 := KEGraph
		nodes: #(#A #B #C #D #E #F #G #H #I #J #K #L #M #N #O).
	tmp2 := KENetworkTopology
		new:
			{#smallworld.
			(#K -> 4).
			(#beta -> 0)}.
	tmp2 applyOn: tmp1.
	self assert: (tmp1 nodes at: 1) adjacentNodes size equals: 4