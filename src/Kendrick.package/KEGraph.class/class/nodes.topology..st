as yet unclassified
nodes: arg1 topology: arg2
	| tmp1 |
	tmp1 := self nodes: arg1.
	(KENetworkTopology new: arg2) applyOn: tmp1.
	^ tmp1