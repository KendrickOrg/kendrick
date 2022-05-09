Class {
	#name : #K2SAN,
	#superclass : #K2MarkovProcess,
	#instVars : [
		'subautomata',
		'sanName',
		'transitions',
		'attributes',
		'stateCardinality'
	],
	#category : #'Kendrick-Core-MM2'
}

{ #category : #adding }
K2SAN >> addTransition: aTransition [
	transitions add: aTransition
]

{ #category : #adding }
K2SAN >> addTransitionFrom: aState to: anotherState probability: aRate [

	self addTransition: (K2Transition
			 from: aState
			 to: anotherState
			 probability: aRate)
]

{ #category : #accessing }
K2SAN >> attributes [
"Return attributes as a Dictionary"
	^ attributes
]

{ #category : #accessing }
K2SAN >> attributes: attributesArray [

	"attributesArray is an array of associations like {#status->#(#S #I #R). #age->#(#child #adult)}"

	(self
		duplicateValues: attributesArray)
		ifTrue: [ self error: 'Attributes are duplicated.' ]
		ifFalse: [ attributes := Dictionary newFrom: attributesArray ]
]

{ #category : #modifying }
K2SAN >> duplicateValues: anArrayOfAssociations [

	| values |
	values := (anArrayOfAssociations collect:
		          [ :each | each value ]) flatten.
	^ (values asSet size) ~~ (values size)
]

{ #category : #accessing }
K2SAN >> sanName [
	^sanName
]

{ #category : #accessing }
K2SAN >> sanName: aName [
	sanName := aName 
]

{ #category : #accessing }
K2SAN >> stateCardinality [
	^stateCardinality
]

{ #category : #accessing }
K2SAN >> stateCardinality: aNumber [
	stateCardinality := aNumber 
]

{ #category : #accessing }
K2SAN >> subautomata [
	^subautomata 
]

{ #category : #accessing }
K2SAN >> subautomata: aAutomaton [
	subautomata := aAutomaton 
]
