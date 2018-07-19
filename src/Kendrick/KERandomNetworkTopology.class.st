"
A KERandomNetworkTopology is xxxxxxxxx.

Instance Variables
	activeNodes:		<Object>
	strengthOfConnection:		<Object>

activeNodes
	- a collection of 

strengthOfConnection
	- for simplicity, supposing that all connections in the network must have the same strength of connection

"
Class {
	#name : #KERandomNetworkTopology,
	#superclass : #KENetworkTopology,
	#instVars : [
		'activeNodes'
	],
	#category : 'Kendrick-Spatial-Core'
}

{ #category : #accessing }
KERandomNetworkTopology >> activeNodes [
	^ activeNodes 
]

{ #category : #'as yet unclassified' }
KERandomNetworkTopology >> appendNode: anAssociation [
	"Create edges following a topology for a Node of a graph (anAssociation=aNode->aGraph)"
	self subclassResponsibility 
]

{ #category : #accessing }
KERandomNetworkTopology >> initialize [
	super initialize.
	activeNodes := OrderedCollection new.
]
