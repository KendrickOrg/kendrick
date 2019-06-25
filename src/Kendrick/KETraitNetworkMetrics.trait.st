"
This trait implement various metrics used in all contact networks.

- c3
- c4
- cc4
- p2 
- R0
"
Trait {
	#name : #KETraitNetworkMetrics,
	#category : #'Kendrick-Network'
}

{ #category : #metrics }
KETraitNetworkMetrics >> c3: aNode [
	"Return the number of triangle (cycle of length 3) starting from aNode"

	| pathTree result |
	result := OrderedCollection new.
	pathTree := self pathOfLength: 2 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 3).
			(neighbors includes: aNode)
				ifTrue: [ result addIfNotPresent: eachPath asSet ] ].
	^ result size
]

{ #category : #metrics }
KETraitNetworkMetrics >> c4: aNode [
	"Return the number of square (cycle of length 4) starting from aNode"

	| pathTree result |
	result := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 4).
			(neighbors includes: aNode)
				ifTrue: [ result addIfNotPresent: eachPath asSet ] ].
	^ result size
]

{ #category : #metrics }
KETraitNetworkMetrics >> cc4: aNode [
	"Return the number of square (cycle of length 4)+chord starting from aNode"

	| pathTree result |
	result := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors1 neighbors2 |
			neighbors1 := self neighborsOf: (eachPath at: 4).
			neighbors2 := self neighborsOf: (eachPath at: 3).
			((neighbors1 includes: aNode)
				and: [ neighbors2 includes: aNode ])
				ifTrue: [ result addIfNotPresent: eachPath asSet ] ].
	^ result size
]

{ #category : #metrics }
KETraitNetworkMetrics >> clustering: aNode [
	"Clustering coefficient of a node"

	^ (3 * self p2: aNode) / self c3: aNode
]

{ #category : #metrics }
KETraitNetworkMetrics >> p2: aNode [
	"Return the number of path of length 2 starting from aNode"

	^ (self pathOfLength: 2 startingFrom: aNode) size
]

{ #category : #metrics }
KETraitNetworkMetrics >> r0 [
	"Return number of nodes of generation 2/ number of nodes of generation 3"

	| nodesGen2 nodesGen3 |
	nodesGen2 := self nodes select: [ :each | each genInfected == 2 ].
	nodesGen3 := self nodes select: [ :each | each genInfected == 3 ].
	nodesGen2 size == 0
		ifTrue: [ ^ Float nan ].
	^ (nodesGen3 size / nodesGen2 size) asFloat
]
