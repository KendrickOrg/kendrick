Class {
	#name : #KESmallWorldNetworkTopologyTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KESmallWorldNetworkTopologyTest >> testAppendNode [
	|g tp|
	g := KEGraph nodes: 10.
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0.5}.
	tp applyOn: g.
	g nodes add: (KENode new label: #'11').
	tp appendNode: 11->g.

	self should: [ (g nodes at: 11) adjacentNodes size >= 0 ]
]

{ #category : #'as yet unclassified' }
KESmallWorldNetworkTopologyTest >> testApplyOn [
	|g tp|
	g := KEGraph nodes: #(A B C D E F G H I J K L M N O).
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0.2}.
	tp applyOn: g.
	
	self should: [(g nodes at: 1) adjacentNodes size >= 1]
]

{ #category : #'as yet unclassified' }
KESmallWorldNetworkTopologyTest >> testApplyOn2 [
	|g tp|
	g := KEGraph nodes: #(A B C D E F G H I J K L M N O).
	tp := KENetworkTopology new: {#smallworld. #K->4. #beta->0}.
	tp applyOn: g.

	self assert: (g nodes at: 1) adjacentNodes size equals: 4
]
