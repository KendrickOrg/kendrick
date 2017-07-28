as yet unclassified
testApplyOn
	|g tp|
	g := KEGraph nodes: 10.
	tp := KENetworkTopology new: { #scalefree. #m0->3 }.
	tp applyOn: g .

	self should: [ (g nodes at: 10) adjacentNodes size >= 0 ]