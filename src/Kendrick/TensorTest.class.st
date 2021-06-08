Class {
	#name : #TensorTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tensor'
}

{ #category : #tests }
TensorTest >> testCreateTensor [

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
