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

{ #category : #'instance creation' }
TensorRank2 class >> zerosWithShape: aShape [

	^ self new
		  array: (Array new: aShape first * aShape second withAll:0)
		  withShape: aShape
]

{ #category : #operations }
TensorRank2 >> * aTensor [

	(self checkProductMatrixSize: aTensor)
		ifTrue: [ 
			| t |
			t := self class zerosWithShape: { 
					     self numberOfLines.
					     aTensor numberOfColumns }.

			1 to: self numberOfLines do: [ :i | 
				1 to: aTensor numberOfColumns do: [ :j | 
					t
						set: { i. j }
						value:
							((1 to: self numberOfColumns) inject: 0 into: [ :sum :k | 
								 (self get: { i. k }) * (aTensor get: { k. j }) + sum ]) ] ].
			^ t ]
		ifFalse: [ ShapeMismatch signal ]
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

{ #category : #'as yet unclassified' }
TensorRank2 >> checkProductMatrixSize: aTensorRank2 [

	^ self numberOfColumns = aTensorRank2 numberOfLines
]

{ #category : #accessing }
TensorRank2 >> checkReshapeIsPossibleWith: aNewShape [

	^ (shape first * shape second) = ((aNewShape first) * (aNewShape second))
]

{ #category : #accessing }
TensorRank2 >> get: coords [
	| row column |
	row := coords first.
	column := coords second.
	^ array at: (row - 1) * (shape second) + column
]

{ #category : #operations }
TensorRank2 >> hadamardProduct: aTensorRank2 [
	(self hasSameShapeAs: aTensorRank2)
	ifTrue:[
		^ self class new array: ((self array) with: (aTensorRank2 array) collect:[:a :b| a*b])
		withShape: self shape.
		]
	ifFalse:[ShapeMismatch signal ]
]

{ #category : #testing }
TensorRank2 >> hasSameShapeAs: aTensorRank2 [ 
	^ self shape = aTensorRank2 shape
]

{ #category : #'as yet unclassified' }
TensorRank2 >> kroneckerProduct: aTensor [

			| t |
			t := self class zerosWithShape: { 
					     ((self numberOfLines) * (aTensor numberOfLines)).
					     ((self numberOfColumns) * (aTensor numberOfColumns)) }.

			1 to: self numberOfLines  do: [ :i1 | 
				1 to: self numberOfColumns do: [ :j1 |
					1 to: aTensor numberOfLines  do: [ :i2 | 
						1 to: aTensor numberOfColumns do: [ :j2 |
															t set: { (i1-1)*(aTensor numberOfLines)+i2. (j1-1)*(aTensor numberOfColumns)+j2 } 
															 value: (self get:{i1. j1})* (aTensor get:{ i2.j2 })
															]
														]
													]
												].
											^t
]

{ #category : #accessing }
TensorRank2 >> numberOfColumns [
	^ shape second
]

{ #category : #delegating }
TensorRank2 >> numberOfLines [
	^ shape first
]

{ #category : #'as yet unclassified' }
TensorRank2 >> outerProduct: aTensor [

			| t |
			t := self class zerosWithShape: { 
					     ((self numberOfLines) * (aTensor numberOfLines)).
					     ((self numberOfColumns) * (aTensor numberOfColumns)) }.

			1 to: self numberOfLines  do: [ :i1 | 
				1 to: self numberOfColumns do: [ :j1 |
					1 to: aTensor numberOfLines  do: [ :i2 | 
						1 to: aTensor numberOfColumns do: [ :j2 |
															t set: { (i1-1)*(aTensor numberOfLines)+i2. (j1-1)*(aTensor numberOfColumns)+j2 } 
															 value: (self get:{i1. i2}) * (aTensor get:{ j1. j2 })
															]
														]
													]
												].
											^t
]

{ #category : #accessing }
TensorRank2 >> reshape: aNewShape [

	(self checkReshapeIsPossibleWith: aNewShape)
		ifTrue: [ shape := aNewShape ]
		ifFalse: [ ShapeMismatch signal ]
]

{ #category : #accessing }
TensorRank2 >> set: coords value: aValue [

	| row column |
	row := coords first.
	column := coords second.
	array at: row - 1 * shape second + column put: aValue
]

{ #category : #accessing }
TensorRank2 >> shape [

	^ shape
]
