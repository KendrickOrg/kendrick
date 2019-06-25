Class {
	#name : #KEErdosGNMContactNetwork,
	#superclass : #MalErdosRenyiGNMGraphGenerator,
	#traits : 'KETraitNetworkMetrics',
	#classTraits : 'KETraitNetworkMetrics classTrait',
	#category : #'Kendrick-Network'
}

{ #category : #metrics }
KEErdosGNMContactNetwork >> infectedNeighborsOf: aNode [
	"Return infected nodes"

	| toNodes fromNodes infectedNodes |
	fromNodes := (edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n1 == aNode and: [ n2 currentStatus == #I ] ] ]) collect: #to.
	toNodes := (edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n2 == aNode and: [ n1 currentStatus == #I ] ] ]) collect: #from.
	infectedNodes := Set new.
	infectedNodes
		addAll: fromNodes;
		addAll: toNodes.
	^ infectedNodes
]

{ #category : #metrics }
KEErdosGNMContactNetwork >> nbOfInfectedNeighborsOf: aNode [
	^ (self infectedNeighborsOf: aNode) size
]

{ #category : #metrics }
KEErdosGNMContactNetwork >> neighborsOf: aNode [
	"Return neighbors nodes"

	| toNodes fromNodes allNodes |
	fromNodes := (edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n1 == aNode ] ]) collect: #to.
	toNodes := (edges
		select: [ :each | 
			| n1 n2 |
			n1 := each from.
			n2 := each to.
			n1 ~= n2 and: [ n2 == aNode ] ]) collect: #from.
	allNodes := Set new.
	allNodes
		addAll: fromNodes;
		addAll: toNodes.
	^ allNodes asOrderedCollection
]

{ #category : #configuration }
KEErdosGNMContactNetwork >> nodeClass [
	^ KEContactNetworkNode
]

{ #category : #metrics }
KEErdosGNMContactNetwork >> pathOfLength: aNumber startingFrom: aNode [
	"Return an ordered collection of paths (path= ordered collection f nodes number)"

	aNumber = 0
		ifTrue: [ ^ OrderedCollection with: (OrderedCollection with: aNode) ]
		ifFalse: [ | result |
			result := OrderedCollection new.
			(self neighborsOf: aNode)
				do: [ :each | 
					| result1 |
					result1 := OrderedCollection new.
					(self pathOfLength: aNumber - 1 startingFrom: each)
						do: [ :eachPath | 
							(eachPath includes: aNode)
								ifFalse: [ result1
										add:
											(eachPath
												addFirst: aNode;
												yourself) ] ].
					result addAll: result1 ].
			^ result ]
]
