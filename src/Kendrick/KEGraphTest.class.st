Class {
	#name : #KEGraphTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Spatial-Core'
}

{ #category : #tests }
KEGraphTest >> testAddNode [
	| g |
	g := KEGraph nodes: 100.
	self assert: g nodes size equals: 100
]

{ #category : #tests }
KEGraphTest >> testAtNode [
	| g |
	g := KEGraph nodes: 100.
	self assert: (g atNode: #'1') label equals: #'1'
]

{ #category : #tests }
KEGraphTest >> testEdgesFromToAll [
	| g |
	g := KEGraph nodes: #(A B C D E).
	g edgesFrom: #A toAll: #(B C D E).
	self assert: g edges size equals: 8
]

{ #category : #tests }
KEGraphTest >> testEdgesFromToAllOneWay [
	| g |
	g := KEGraph nodes: #(A B C D E).
	g edgesFrom: #A toAll: #(B C D E) oneWay: true.
	self assert: g edges size equals: 4
]
