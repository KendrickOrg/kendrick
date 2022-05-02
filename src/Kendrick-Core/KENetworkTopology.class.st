"
A KENetworkTopology is a topology of a network, responsible for creating a collection of edges for a network following a topology.

Having two groups of topology: random network topologies and non-random topology. The non-random topology can take a configuration file that contains nodes and edges to create the network

"
Class {
	#name : #KENetworkTopology,
	#superclass : #KEEntity,
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KENetworkTopology class >> new: topology [
	|networkTopology|
	topology first = #scalefree ifTrue: [  networkTopology := KEScaleFreeNetworkTopology new ].
	topology first = #smallworld ifTrue: [  networkTopology := KESmallWorldNetworkTopology new ].
	topology first = #random ifTrue: [  networkTopology := KEERRandomNetworkTopology new ].
	2 to: topology size do: [ :i| |method|
		method := ((topology at: i) key asString, ':') asSymbol.
		networkTopology perform: method with: (topology at: i) value
	].
	^ networkTopology
	
]

{ #category : #'instance creation' }
KENetworkTopology >> applyOn: graph [
	self subclassResponsibility 
]
