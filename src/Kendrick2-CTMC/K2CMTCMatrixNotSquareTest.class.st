Class {
	#name : #K2CMTCMatrixNotSquareTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-CTMC-Tests'
}

{ #category : #tests }
K2CMTCMatrixNotSquareTest >> testExceptionWhenMatrixNotSquareBlockClosure1 [
	self should: [   [  
		[ 0.4, 0.6 ],
		[ 0.7, 0.3 ],
		[ 0.7, 0.3 ]
	] asCTMC. ] raise: K2InputMatrixNotSquareException.
]

{ #category : #tests }
K2CMTCMatrixNotSquareTest >> testExceptionWhenMatrixNotSquareBlockClosure2 [
	self should: [   [  
		[ 0.4, 0.5, 0.1],
		[ 0.7, 0.2, 0.1 ] 
	] asCTMC. ] raise: K2InputMatrixNotSquareException 
]
