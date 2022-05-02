"
I'm a compartment with a cardinality and a name.

"
Class {
	#name : #KECompartment,
	#superclass : #KEEntity,
	#instVars : [
		'cardinality',
		'compartmentName'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #accessing }
KECompartment >> cardinality [
	^ cardinality
]

{ #category : #accessing }
KECompartment >> cardinality: anInteger [
	cardinality := anInteger 
]

{ #category : #accessing }
KECompartment >> compartmentName [
^	compartmentName
]

{ #category : #accessing }
KECompartment >> compartmentName: aName [
	compartmentName := aName
]
