Class {
	#name : #Tensor,
	#superclass : #Object,
	#instVars : [
		'array',
		'shape'
	],
	#category : #'Kendrick-Tensor'
}

{ #category : #'instance creation' }
Tensor class >> rows: anArray [

	^ self new array: anArray flattened withShape: (self shape:anArray)
]

{ #category : #'instance creation' }
Tensor class >> shape: anArray [

anArray isArray ifFalse:[^#()]
ifTrue:[
	^ {anArray size}, (self shape: anArray first)
	]

]

{ #category : #accessing }
Tensor >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape
]

{ #category : #accessing }
Tensor >> shape [

	^ shape
]
