Class {
	#name : #TensorRank2,
	#superclass : #Object,
	#instVars : [
		'array',
		'shape'
	],
	#category : #'Kendrick-Tensor'
}

{ #category : #'intance creation' }
TensorRank2 class >> rows: anArray [

	^ self new array: anArray flattened withShape: { 
			  anArray size.
			  (anArray at: 1) size }
]

{ #category : #accessing }
TensorRank2 >> array: aCollection withShape: anArray [
	array := aCollection.
	shape := anArray
]

{ #category : #accessing }
TensorRank2 >> at: row at: column [

	^ array at: ((row - 1) * (shape second)) + column
]

{ #category : #accessing }
TensorRank2 >> shape [

	^ shape
]
