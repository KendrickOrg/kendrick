as yet unclassified
nodes: argument topology: aTopology
	|g|
	g := self nodes:argument.
	(KENetworkTopology new: aTopology) applyOn: g.
	^ g