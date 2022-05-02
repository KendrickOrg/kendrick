"
The KEGraph represents a spatial structure of epidemiological models, each node is a subpopulation and an edge represent a connection between two spatial subpopulation.

    Instance Variables
	edges:		<Object>
	nodes:		<Object>
	numberOfEdges:         <Number>


    Implementation Points

numberOfEdges: to reduce leaked memory, instead of using a collection edges, I use this instance variable to store the number of edges in network 
"
Class {
	#name : #KEGraph,
	#superclass : #KEEntity,
	#instVars : [
		'nodes',
		'edges',
		'numberOfEdges'
	],
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #accessing }
KEGraph class >> nodes: argument [
	|g|
	g := super new.
	argument isNumber ifTrue: [ 1 to: argument do: [ :i| g addNode: i asString asSymbol] ].
	argument isArray ifTrue: [ argument do: [ :e| g addNode: e ] ].
	^ g
]

{ #category : #'as yet unclassified' }
KEGraph class >> nodes: argument topology: aTopology [
	|g|
	g := self nodes:argument.
	(KENetworkTopology new: aTopology) applyOn: g.
	^ g
]

{ #category : #adding }
KEGraph >> addNode: label [
	nodes add: (KENode new label: label)
]

{ #category : #accessing }
KEGraph >> atNode: aLabel [
	^ self nodes detect: [ :n | n label = aLabel ]
]

{ #category : #accessing }
KEGraph >> edges [
	^ edges
]

{ #category : #public }
KEGraph >> edgesFrom: aNode toAll: otherNodes [
	self edgesFrom: aNode toAll: otherNodes oneWay: false
]

{ #category : #public }
KEGraph >> edgesFrom: aNode toAll: otherNodes oneWay: boolean [
	otherNodes do: [ :n|
		edges add: aNode->n. 
		numberOfEdges := numberOfEdges + 1.
		(self atNode: aNode) addAdjacentNode: n.
		boolean ifFalse: [ 
			edges add: n->aNode.
			numberOfEdges := numberOfEdges + 1.
			(self atNode: n) addAdjacentNode: aNode ]
	]
]

{ #category : #initialization }
KEGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
	edges := OrderedCollection new.
	numberOfEdges := 0.
]

{ #category : #accessing }
KEGraph >> nodes [
	^ nodes
]

{ #category : #accessing }
KEGraph >> numberOfEdges [
	^numberOfEdges.
]

{ #category : #accessing }
KEGraph >> numberOfEdges: aNumber [
	numberOfEdges := aNumber.
]
