Class {
	#name : #TensorRank2Test,
	#superclass : #TestCase,
	#instVars : [
		'array'
	],
	#category : #'Kendrick-Tensor'
}

{ #category : #tests }
TensorRank2Test >> testCreateTensor [

	| t1 t2|
	t1 := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 get: #(1 1)) equals: 1.
	self assert: (t1 get: #(2 1)) equals: 5.
	self assert: (t1 get: #(2 4)) equals: 8.
	t2 := TensorRank2 rows: #( #( 1 2) #(3 4) #( 5 6) #(7 8 )).
	self assert: (t2 get: #(1 1)) equals: 1.
	self assert: (t2 get: #(2 1)) equals: 3.
	self assert: (t2 get: #(4 2)) equals: 8.
	
	

]

{ #category : #tests }
TensorRank2Test >> testCreateTensorFilledWithZeros [

	| t |
	t := TensorRank2 zerosWithShape: #( 10 10 ).
	1 to: t numberOfColumns do: [ :i | 
		1 to: t numberOfLines do: [ :j | 
			self
				assert: (t get: { 
							 i.
							 j })
				equals: 0 ] ]
]

{ #category : #tests }
TensorRank2Test >> testHadamardProduct [
|t1 t2|
 t1 := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
 t2 := TensorRank2 rows: #( #( 4 3 2 9 ) #( 9 7 6 5 ) ).
 self assert: (t1 hadamardProduct: t2) equals: (TensorRank2 rows:#( #( 4 6 6 36 ) #( 45 42 42 40 ) ))
]

{ #category : #tests }
TensorRank2Test >> testHadamardProductWithDifferentShapes [
|t1 t2|
 t1 := TensorRank2 rows: #( #( 1 2) #(3 4) #(5 6) #(7 8)).
 t2 := TensorRank2 rows: #( #( 4 3 2 9 ) #( 9 7 6 5 ) ).
 self should: [t1 hadamardProduct: t2] raise: ShapeMismatch 
]

{ #category : #tests }
TensorRank2Test >> testKroneckerProduct [
|t1 t2|
 t1 := TensorRank2 rows: #( #( 1 2 ) #( 3 1 )).
 t2 := TensorRank2 rows: #( #( 0 3 ) #( 2 1 )).
 self assert: (t1 kroneckerProduct: t2) equals: (TensorRank2 rows:#( #( 0 3 0 6 ) #( 2 1 4 2 ) #( 0 9 0 3 ) #( 6 3 2 1 ) ))
]

{ #category : #tests }
TensorRank2Test >> testOrdinaryProduct [
|t1 t2|
 t1 := TensorRank2 rows: #( #( 1 2 )
									#( 3 4 )).
 t2 := TensorRank2 rows: #( #( 4 3 )
									#( 2 5 )).
 self assert: (t1 * t2) equals: (TensorRank2 rows:#( #( 8 13 ) #( 20 29 ) ))
]

{ #category : #tests }
TensorRank2Test >> testOrdinaryProductWithTheNumberOFLineOfFirstTensorIsEqualsOfNumberOfColumnToSecondTensor [

	| t1 t2 |
	t1 := TensorRank2 rows: #( #( 1 2 ) #( 3 4 ) #( 5 6 ) ).
	t2 := TensorRank2 rows: #( #( 4 3 2 ) #( 9 7 6 ) #(10 11 12)).
	self should: [ t1 * t2 ] raise: ShapeMismatch
]

{ #category : #tests }
TensorRank2Test >> testShape [

	| t |
	t := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t shape equals: #( 2 4 )
]
