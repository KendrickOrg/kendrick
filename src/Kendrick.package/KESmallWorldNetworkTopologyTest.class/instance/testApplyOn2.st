as yet unclassified
testApplyOn2
	|g tp|
	g := KEGraph nodes: #(A B C D E F G H I J K L M N O).
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0}.
	tp applyOn: g.

	self assert: (g nodes at: 1) adjacentNodes size equals: 4