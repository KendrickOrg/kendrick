Class {
	#name : #K2State,
	#superclass : #Object,
	#instVars : [
		'stateName',
		'cardinality'
	],
	#category : #'Kendrick-Core-MM2'
}

{ #category : #accessing }
K2State >> cardinality [
	^ cardinality
]

{ #category : #accessing }
K2State >> cardinality: anInteger [
	cardinality := anInteger
]

{ #category : #accessing }
K2State >> stateName [
	^ stateName
]

{ #category : #accessing }
K2State >> stateName: aName [
	stateName := aName 
]
