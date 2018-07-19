"
A KERandomScaleFreeNetwork formulates a random graph using the Barabasi-Albert model (BA) with the initial degree is set to m0.

Instance Variables
	m0:		<Object>

m0
	- The initial degree of the network

"
Class {
	#name : #KEScaleFreeNetworkTopology,
	#superclass : #KERandomNetworkTopology,
	#instVars : [
		'm0'
	],
	#category : 'Kendrick-Spatial-Core'
}

{ #category : #'as yet unclassified' }
KEScaleFreeNetworkTopology >> appendNode: anAssociation [
	|label graph rand sumOfKj m|
	label := anAssociation key.
	graph := anAssociation value.
	rand := Random new.
	sumOfKj := (activeNodes collect: [:j| (graph atNode: j) adjacentNodes size]) sum.
	m := 0.
	[ m <= m0 ] whileTrue: [
		activeNodes do: [ :node| 
			|pi ki|
			ki := (graph atNode: node) adjacentNodes size.
			pi := ki / sumOfKj.
			(pi > rand next) ifTrue: [ 
				graph edgesFrom: label toAll: (Array with: node).
				m := m + 1 ]
			]
		].
	activeNodes add: label
]

{ #category : #'instance creation' }
KEScaleFreeNetworkTopology >> applyOn: graph [
	"initialize with m0 degree"
	activeNodes add: (graph nodes first) label.
	2 to: (m0 + 1) do: [ :i| 
		activeNodes add: (graph nodes at: i) label.
		graph edgesFrom: (graph nodes first) label toAll: (Array with: (graph nodes at: i) label) 
	].
	(m0 + 2) to: graph nodes size do: [ :i|
		self appendNode: (graph nodes at: i) label->graph
		]
]

{ #category : #accessing }
KEScaleFreeNetworkTopology >> m0: aValueSmallerThanSizeOfNodes [
	m0 := aValueSmallerThanSizeOfNodes 
]
