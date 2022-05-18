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
	| ctmc1 ctmc2 |
	ctmc1 := self createCTMCWithFourStates.
	ctmc2 := self otherWaycreateCTMCWithFourStates.
	
	self assert: ctmc1 class equals: K2CTMC.
	self assert: ctmc2 class equals: K2CTMC.
	
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testNumberOfStatesofCTMCs [

	<gtExample>
	| ctmc1 ctmc2 |
	ctmc1 := self createCTMCWithFourStates.
	ctmc2 := self otherWaycreateCTMCWithFourStates.
	self assert: ctmc1 states size equals: 4.
	self assert: ctmc2 states size equals: 4.
	
]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testRateOfCTMC [
<gtExample>
| ctmc1 ctmc2 |

ctmc1 := self createCTMCWithFourStates.
ctmc2 := self otherWaycreateCTMCWithFourStates.

self assert: (ctmc1 rateFrom: 1 to: 1)  equals: -1.
self assert: (ctmc1 rateFrom: 1 to: 2)  equals: 1.
self assert: (ctmc1 rateFrom: 1 to: 3)  equals: 0.
self assert: (ctmc1 rateFrom: 1 to: 4)  equals: 0.

self assert: (ctmc1 rateFrom: 2 to: 1)  equals: 5.
self assert: (ctmc1 rateFrom: 2 to: 2)  equals: -10.
self assert: (ctmc1 rateFrom: 2 to: 3)  equals: 5.
self assert: (ctmc1 rateFrom: 2 to: 4)  equals: 0.

self assert: (ctmc1 rateFrom: 3 to: 1)  equals: 0.
self assert: (ctmc1 rateFrom: 3 to: 2)  equals: 8.
self assert: (ctmc1 rateFrom: 3 to: 3)  equals: -12.
self assert: (ctmc1 rateFrom: 3 to: 4)  equals: 4.

self assert: (ctmc1 rateFrom: 4 to: 1)  equals: 0.
self assert: (ctmc1 rateFrom: 4 to: 2)  equals: 0.
self assert: (ctmc1 rateFrom: 4 to: 3)  equals: 10.
self assert: (ctmc1 rateFrom: 4 to: 4)  equals: -10.

self assert: (ctmc2 rateFrom: 1 to: 1)  equals: -1.
self assert: (ctmc2 rateFrom: 1 to: 2)  equals: 1.
self assert: (ctmc2 rateFrom: 1 to: 3)  equals: 0.
self assert: (ctmc2 rateFrom: 1 to: 4)  equals: 0.

self assert: (ctmc2 rateFrom: 2 to: 1)  equals: 5.
self assert: (ctmc2 rateFrom: 2 to: 2)  equals: -10.
self assert: (ctmc2 rateFrom: 2 to: 3)  equals: 5.
self assert: (ctmc2 rateFrom: 2 to: 4)  equals: 0.

self assert: (ctmc2 rateFrom: 3 to: 1)  equals: 0.
self assert: (ctmc2 rateFrom: 3 to: 2)  equals: 8.
self assert: (ctmc2 rateFrom: 3 to: 3)  equals: -12.
self assert: (ctmc2 rateFrom: 3 to: 4)  equals: 4.

self assert: (ctmc2 rateFrom: 4 to: 1)  equals: 0.
self assert: (ctmc2 rateFrom: 4 to: 2)  equals: 0.
self assert: (ctmc2 rateFrom: 4 to: 3)  equals: 10.
self assert: (ctmc2 rateFrom: 4 to: 4)  equals: -10.


]

{ #category : #tests }
K2CMTCWithFourStatesTest >> testSumColumnsRateOfCTMCForFourStatesisZero [

<gtExample>
| ctmc1 ctmc2 |

ctmc1 := self createCTMCWithFourStates.
ctmc2 := self otherWaycreateCTMCWithFourStates.

self assert: ((ctmc1 rateFrom: 1 to: 1) + (ctmc1 rateFrom: 1 to: 2) +  (ctmc1 rateFrom: 1 to: 3) + (ctmc1 rateFrom: 1 to: 4)) equals: 0.

self assert: ((ctmc1 rateFrom: 2 to: 1) + (ctmc1 rateFrom: 2 to: 2) + (ctmc1 rateFrom: 2 to: 3) + (ctmc1 rateFrom: 2 to: 4))  equals: 0.

self assert: ((ctmc1 rateFrom: 3 to: 1) + (ctmc1 rateFrom: 3 to: 2) + (ctmc1 rateFrom: 3 to: 3) + (ctmc1 rateFrom: 3 to: 4))  equals: 0.

self assert: ((ctmc1 rateFrom: 4 to: 1) + (ctmc1 rateFrom: 4 to: 2) + (ctmc1 rateFrom: 4 to: 3) + (ctmc1 rateFrom: 4 to: 4))  equals: 0.

self assert: ((ctmc2 rateFrom: 1 to: 1) + (ctmc2 rateFrom: 1 to: 2) +  (ctmc2 rateFrom: 1 to: 3) + (ctmc2 rateFrom: 1 to: 4)) equals: 0.

self assert: ((ctmc2 rateFrom: 2 to: 1) + (ctmc2 rateFrom: 2 to: 2) + (ctmc2 rateFrom: 2 to: 3) + (ctmc2 rateFrom: 2 to: 4))  equals: 0.

self assert: ((ctmc2 rateFrom: 3 to: 1) + (ctmc2 rateFrom: 3 to: 2) + (ctmc2 rateFrom: 3 to: 3) + (ctmc2 rateFrom: 3 to: 4))  equals: 0.

self assert: ((ctmc2 rateFrom: 4 to: 1) + (ctmc2 rateFrom: 4 to: 2) + (ctmc2 rateFrom: 4 to: 3) + (ctmc2 rateFrom: 4 to: 4))  equals: 0.


]
