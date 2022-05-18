Class {
	#name : #K2CMTCWithFourStatesTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
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

{ #category : #'as yet unclassified' }
K2CMTCWithFourStatesTest >> otherWaycreateCTMCWithFourStates [

| s |

s := Set new.
s add: K2CTMCState new.
s add: K2CTMCState new.
s add: K2CTMCState new.
s add: K2CTMCState new.

^ [  
[ -1, 1, 0, 0 ],
[ 5, -10, 5, 0 ],
[ 0, 8, -12, 4 ],
[ 0, 0, 10, -10 ]
] asCTMCWithStates: s.
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testCreateCTMCofFourStates [

	<gtExample>
	| ctmc |
	ctmc := self createCTMCWithFourStates.
	self assert: ctmc class equals: K2CTMC.
	^ ctmc
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testNumberOfStatesofCTMCs [

	<gtExample>
	| ctmc |
	ctmc := self createCTMCWithFourStates.
	self assert: ctmc states size equals: 4.
	^ ctmc
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testRateOfCTMC [
<gtExample>
| ctmc |

ctmc := self createCTMCWithFourStates.

self assert: (ctmc probabilityFrom: 1 to: 1)  equals: -1.
self assert: (ctmc probabilityFrom: 1 to: 2)  equals: 1.
self assert: (ctmc probabilityFrom: 1 to: 3)  equals: 0.
self assert: (ctmc probabilityFrom: 1 to: 4)  equals: 0.

self assert: (ctmc probabilityFrom: 2 to: 1)  equals: 5.
self assert: (ctmc probabilityFrom: 2 to: 2)  equals: -10.
self assert: (ctmc probabilityFrom: 2 to: 3)  equals: 5.
self assert: (ctmc probabilityFrom: 2 to: 4)  equals: 0.

self assert: (ctmc probabilityFrom: 3 to: 1)  equals: 0.
self assert: (ctmc probabilityFrom: 3 to: 2)  equals: 8.
self assert: (ctmc probabilityFrom: 3 to: 3)  equals: -12.
self assert: (ctmc probabilityFrom: 3 to: 4)  equals: 4.

self assert: (ctmc probabilityFrom: 4 to: 1)  equals: 0.
self assert: (ctmc probabilityFrom: 4 to: 2)  equals: 0.
self assert: (ctmc probabilityFrom: 4 to: 3)  equals: 10.
self assert: (ctmc probabilityFrom: 4 to: 4)  equals: -10.

^ctmc
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testSumColumnsRateOfCTMCForFourStatesisZero [

<gtExample>
| ctmc |

ctmc := self createCTMCWithFourStates.

self assert: ((ctmc probabilityFrom: 1 to: 1) + (ctmc probabilityFrom: 1 to: 2) +  (ctmc probabilityFrom: 1 to: 3) + (ctmc probabilityFrom: 1 to: 4)) equals: 0.


self assert: ((ctmc probabilityFrom: 2 to: 1) + (ctmc probabilityFrom: 2 to: 2) + (ctmc probabilityFrom: 2 to: 3) + (ctmc probabilityFrom: 2 to: 4))  equals: 0.

self assert: ((ctmc probabilityFrom: 3 to: 1) + (ctmc probabilityFrom: 3 to: 2) + (ctmc probabilityFrom: 3 to: 3) + (ctmc probabilityFrom: 3 to: 4))  equals: 0.

self assert: ((ctmc probabilityFrom: 4 to: 1) + (ctmc probabilityFrom: 4 to: 2) + (ctmc probabilityFrom: 4 to: 3) + (ctmc probabilityFrom: 4 to: 4))  equals: 0.

^ctmc
]
