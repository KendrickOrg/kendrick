Class {
	#name : #KENodeTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KENodeTest >> testAdjacentNodes [
	|graph node|
	graph := KEGraph nodes: #(A B C D E).
	graph edgesFrom: #A toAll: #(B C D E).
	node := graph atNode: #A.
	
	self assert: (node adjacentNodes size) equals: 4.
	
]
