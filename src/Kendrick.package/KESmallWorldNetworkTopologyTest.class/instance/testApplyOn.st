as yet unclassified
testApplyOn
	|g tp|
	g := KEGraph nodes: #(A B C D E F G H I J K L M N O).
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0.2}.
	tp applyOn: g.
	
	self should: [(g nodes at: 1) adjacentNodes size >= 1]