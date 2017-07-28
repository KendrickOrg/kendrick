as yet unclassified
new: topology
	|networkTopology|
	topology first = #scalefree ifTrue: [  networkTopology := KEScaleFreeNetworkTopology new ].
	topology first = #smallworld ifTrue: [  networkTopology := KESmallWorldNetworkTopology new ].
	topology first = #random ifTrue: [  networkTopology := KEERRandomNetworkTopology new ].
	2 to: topology size do: [ :i| |method|
		method := ((topology at: i) key asString, ':') asSymbol.
		networkTopology perform: method with: (topology at: i) value
	].
	^ networkTopology
	