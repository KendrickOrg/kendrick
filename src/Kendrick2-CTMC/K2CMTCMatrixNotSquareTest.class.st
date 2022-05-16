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
