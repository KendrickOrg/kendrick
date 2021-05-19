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

	| t |
	t := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t at: 1 at: 1) equals: 1.
	self assert: (t at: 2 at: 1) equals: 5.
	self assert: (t at: 2 at: 4) equals: 8
]

{ #category : #tests }
TensorRank2Test >> testShape [

	| t |
	t := TensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t shape equals: #( 2 4 )
]
