as yet unclassified
testApplyOn
	|g|
	g := KEGraph nodes: 10 topology: { #random. #p->0.4 }.

	self should: [(g nodes at: 1) adjacentNodes size >= 0]