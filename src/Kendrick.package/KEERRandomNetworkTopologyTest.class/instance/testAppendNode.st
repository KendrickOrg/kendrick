as yet unclassified
testAppendNode
	| tmp1 tmp2 |
	tmp1 := KEGraph nodes: 10.
	tmp2 := KENetworkTopology
		new:
			{#random.
			(#p -> 0.5)}.
	tmp2
		appendNode: #'1' -> tmp1;
		appendNode: #'2' -> tmp1;
		appendNode: #'3' -> tmp1;
		appendNode: #'4' -> tmp1.
	self should: [ (tmp1 nodes at: 1) adjacentNodes size >= 0 ]