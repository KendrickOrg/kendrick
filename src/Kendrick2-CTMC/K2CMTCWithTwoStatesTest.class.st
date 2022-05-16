Class {
	#name : #K2CMTCWithTwoStatesTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-CTMC-Tests'
}

{ #category : #'as yet unclassified' }
K2CMTCWithTwoStatesTest >> createCTMCWithTwoStates [

^ [  
[ -0.4, 0.4 ],
[ 0.7, -0.7 ]
] asCTMC.
]
