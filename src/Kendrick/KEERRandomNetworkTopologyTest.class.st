Class {
	#name : #KEERRandomNetworkTopologyTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #accessing }
KEERRandomNetworkTopologyTest >> testAppendNode [
	| g tp |
	g := KEGraph nodes: 10.
	tp := KENetworkTopology
		new:
			{#random.
			(#p -> 0.5)}.
	tp appendNode: #'1' -> g.
	tp appendNode: #'2' -> g.
	tp appendNode: #'3' -> g.
	tp appendNode: #'4' -> g.
	self assert: (g nodes at: 1) adjacentNodes size >= 0
]

{ #category : #accessing }
KEERRandomNetworkTopologyTest >> testApplyOn [
	| g |
	g := KEGraph
		nodes: 10
		topology:
			{#random.
			(#p -> 0.4)}.
	self assert: (g nodes at: 1) adjacentNodes size >= 0
]
