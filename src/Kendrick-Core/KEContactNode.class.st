"
Represent a  node in a network contact
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #KEContactNode,
	#superclass : #KENode,
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEContactNode >> contactsOf: arguments [
	"{model. attrbute1->value1. attribute2->value2}"
	|model rs|
	model := arguments first.
	rs := 0.
	self adjacentNodes do: [ :node||attributes|
		attributes := Dictionary new.
		(arguments size > 1) ifTrue: [ 
			2 to: (arguments size) do: [ :i| attributes at: (arguments at: i) key put: (arguments at: i) value ] ].
		attributes at: #node put: node.  
		rs := rs + (self sumAll: (model atCompartment: attributes))
	].
 	^ rs
]

{ #category : #'as yet unclassified' }
KEContactNode >> sumAll: anArray [
	anArray isNumber ifTrue: [ ^ anArray ].
	anArray isArray ifTrue: [ ^ (anArray collect: [ :each| self sumAll: each ]) sum ]
]
