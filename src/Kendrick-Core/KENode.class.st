"
A KENode represents a node in graph (KEGraph). 

Instance Variables
	adjacentNodes:		<OrderedCollection>
	weights:		<Dictionary>
	degree:           <Number>

adjacentNodes
	- a list of nodes linked to this node.

weights
	- a dictionary of weight list. The key is the weight name (ex: #beta, #gamma etc.). The value is a list of weight values that shows the interaction of this node and its linked nodes.

degree
          - a number of edges which rise from this node.

"
Class {
	#name : #KENode,
	#superclass : #KEEntity,
	#instVars : [
		'adjacentNodes',
		'label',
		'degree'
	],
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #adding }
KENode >> = aNode [
	^ self label = aNode label
]

{ #category : #adding }
KENode >> addAdjacentNode: aNodeLabel [
	adjacentNodes add: aNodeLabel.
	degree := degree + 1.
]

{ #category : #accessing }
KENode >> adjacentNodes [
	^ adjacentNodes.
]

{ #category : #accessing }
KENode >> degree [
	^degree.
]

{ #category : #accessing }
KENode >> degree: aNumber [
	degree := aNumber.
]

{ #category : #initialization }
KENode >> initialize [ 
	super initialize.
	adjacentNodes := OrderedCollection new.
	degree := 0.

]

{ #category : #accessing }
KENode >> label [
	^ label
]

{ #category : #accessing }
KENode >> label: aString [
	label := aString
]

{ #category : #printing }
KENode >> printOn: aStream [
	"Each node has a label who is an array of associations attribute->value, in the case of each node representing an individual, do not print the id of this individual"
	aStream nextPutAll: label asString
]
