Class {
	#name : #K2CMTCWithFourStatesTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-CTMC-Tests'
}

{ #category : #'as yet unclassified' }
K2CMTCWithFourStatesTest >> createCTMCWithFourStates [

^ [  
[ -1, 1, 0, 0 ],
[ 5, -10, 5, 0 ],
[ 0, 8, -12, 4 ],
[ 0, 0, 10, -10 ]
] asCTMC.
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testCreateCTMCofFourStates [

<gtExample>
| ctmc |

ctmc :=self createCTMCWithFourStates.

self assert: (ctmc class  = K2CTMC).
^ctmc
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testNumberOfStatesofCTMCs [

<gtExample>
| ctmc |

ctmc :=self createCTMCWithFourStates.

self assert: (ctmc states size)  equals: 4.
^ctmc
]
