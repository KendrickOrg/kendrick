Class {
	#name : #TensorTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tensor'
}

{ #category : #tests }
TensorTest >> testGet [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).

	self assert: (t1 get: #( 2 2 )) equals: 6.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) )
							#( #( 5 6 ) #( 7 8 ) )
		         			#( #( 9 10 ) #( 11 12 ) )
							#( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 get: #( 3 2 1 )) equals: 11
]

{ #category : #test }
TensorTest >> testGetPosition [
| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 getPosition:#(1 2)) equals: 2.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 getPosition:#(1 2 2)) equals: 4
]

{ #category : #tests }
TensorTest >> testRank [

	| t1 t2 |
	
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 rank equals: 2.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 rank equals: 3
]

{ #category : #tests }
TensorTest >> testRows [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 class equals: Tensor.
	
	t2 := Tensor rows: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 class equals: Tensor.
	
]

{ #category : #tests }
TensorTest >> testSetValue [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	t1 set: #( 2 2 ) value: 3.
	self assert: (t1 get: #( 2 2 ) ) equals: 3.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) )
							#( #( 5 6 ) #( 7 8 ) )
		         			#( #( 9 10 ) #( 11 12 ) )
							#( #( 13 14 ) #( 15 16 ) ) ).
	t2 set: #( 2 2 1) value: 10.
	self assert: (t2 get: #( 2 2 1 )) equals: 10
]

{ #category : #tests }
TensorTest >> testShape [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 shape equals: #( 2 4 ).

	t2 := Tensor rows: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 shape equals: #( 4 2 2 )
]

{ #category : #tests }
TensorTest >> testSize [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 size equals: 8.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 size equals: 16
]

{ #category : #tests }
TensorTest >> testSizeAtDepth [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 sizeAtDepth: 0) equals: t1 size.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 sizeAtDepth: 0) equals: t2 size.
	self assert: (t2 sizeAtDepth: 1) equals: 4.
	self assert: (t2 sizeAtDepth: 2) equals: 2.
	self assert: (t2 sizeAtDepth: 3) equals: 1
]

{ #category : #tests }
TensorTest >> testSizeAtDepthError [

	| t1 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self should: [t1 sizeAtDepth: 3] raise: SubscriptOutOfBounds
]
