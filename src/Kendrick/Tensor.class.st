Class {
	#name : #Tensor,
	#superclass : #Object,
	#instVars : [
		'array',
		'shape',
		'first',
		'strides'
	],
	#category : #'Kendrick-Tensor'
}

{ #category : #'instance creation' }
Tensor class >> newWith: anInteger [

	^ self new array: {anInteger} withShape: #(  )
]

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

{ #category : #'as yet unclassified' }
Tensor >> = aTensor [

	^ array = aTensor array & (first = aTensor first)
	  & (strides = aTensor strides) & (shape = aTensor shape)
]

{ #category : #accessing }
Tensor >> array [ 
^array
]

{ #category : #accessing }
Tensor >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #accessing }
Tensor >> first [ 
^first
]

{ #category : #accessing }
Tensor >> get: coords [

	| position |
	position := self getPosition: coords.
	^ array at: position
]

{ #category : #accessing }
Tensor >> getPosition: coords [

	| position |
	position := 1.
	coords withIndexDo: [ :elt :i | 
		position := elt - 1 * (strides at: i) + position ].
	^ position
]

{ #category : #accessing }
Tensor >> rank [
	^ shape size
]

{ #category : #accessing }
Tensor >> reshape: aNewShape [

	^ self viewWithShape: aNewShape.

]

{ #category : #accessing }
Tensor >> set: coords value: aValue [

array at: (self getPosition: coords) put: aValue
]

{ #category : #accessing }
Tensor >> shape [

	^ shape
]

{ #category : #accessing }
Tensor >> size [

	| product |
	product := 1.
	shape do: [ :each | product := each * product ].
	^ product
]

{ #category : #accessing }
Tensor >> strides [ 
^strides 
]

{ #category : #accessing }
Tensor >> updateFirst [

	first := Array new: shape size withAll: 1
]

{ #category : #accessing }
Tensor >> updateStrides [

	strides := Array new: shape size.
	strides at: shape size put: 1.
	((shape size -1) to: 1 by: -1) do: [ :i | 
		strides at: i put: ((strides at: i + 1) * (shape at: i+1))]
]

{ #category : #'as yet unclassified' }
Tensor >> view [

	"Share only the array"

	^ self viewWithShape: shape
]

{ #category : #accessing }
Tensor >> viewWithShape: aNewShape [

	^ Tensor new array: self array withShape: aNewShape

]
