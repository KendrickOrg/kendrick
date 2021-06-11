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

{ #category : #accessing }
Tensor >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape
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
		position := elt - 1 * (self sizeAtDepth: i) + position ].
	^ position
]

{ #category : #accessing }
Tensor >> rank [
	^ shape size
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
Tensor >> sizeAtDepth: depth [

	| product |
	depth > self rank ifTrue:[SubscriptOutOfBounds signal].
	product := 1.
	depth + 1 to: self rank do: [ :i | 
			product := (shape at: i) * product ].
	^ product
]
