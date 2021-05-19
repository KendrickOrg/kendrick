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
TensorRank2Test >> testShape [

	| t |
	t := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t shape equals: #( 2 4 )
]
