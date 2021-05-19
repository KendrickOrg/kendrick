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

{ #category : #comparing }
TensorRank2 >> = aTensorRank2 [

^ (self hasSameShapeAs: aTensorRank2) & (self array = aTensorRank2 array)
]

{ #category : #accessing }
TensorRank2 >> array [
	^ array
]

{ #category : #accessing }
TensorRank2 >> array: aFlatArray withShape: aShape [
	array := aFlatArray.
	shape := aShape
]

{ #category : #accessing }
TensorRank2 >> get: coords [
	| row column |
	row := coords first.
	column := coords second.
	^ array at: (row - 1) * (shape second) + column
]

{ #category : #operation }
TensorRank2 >> hadamardProduct: aTensorRank2 [
	(self hasSameShapeAs: aTensorRank2)
	ifTrue:[
		^ TensorRank2 new array: ((self array) with: (aTensorRank2 array) collect:[:a :b| a*b])
		withShape: self shape.
		]
	ifFalse:[ShapeMismatch signal ]
]

{ #category : #testing }
TensorRank2 >> hasSameShapeAs: aTensorRank2 [ 
	^ self shape = aTensorRank2 shape
]

{ #category : #accessing }
TensorRank2 >> shape [

	^ shape
]
