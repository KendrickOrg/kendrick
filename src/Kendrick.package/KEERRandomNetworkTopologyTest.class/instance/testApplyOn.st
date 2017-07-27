as yet unclassified
testApplyOn
	| tmp1 |
	tmp1 := KEGraph
		nodes: 10
		topology:
			{#random.
			(#p -> 0.4)}.
	self should: [ (tmp1 nodes at: 1) adjacentNodes size >= 0 ]