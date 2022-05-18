Class {
	#name : #K2CMTCWithTwoStatesTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #'as yet unclassified' }
K2CMTCWithTwoStatesTest >> createCTMCWithTwoStates [

^ [  
[ -0.4, 0.4 ],
[ 0.7, -0.7 ]
] asCTMC.
]

{ #category : #'as yet unclassified' }
K2CMTCWithTwoStatesTest >> otherWayToCreateCTMCWithTwoStates [

| s |

s := Set new.
s add: K2CTMCState new.
s add: K2CTMCState new.

^ [  
[ -0.4, 0.4 ],
[ 0.7, -0.7 ]
] asCTMCWithStates: s.
]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testANewCTMCHasNoStates [
	<gtExample>
	| ctmc |
	ctmc := K2CTMC new.
	self assert: ctmc states isEmpty.
	^ctmc 
]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testANewCTMCHaveCurrentStateInitilizeToNil [
	<gtExample>
	| ctmc |
	ctmc := K2CTMC new.
	self assert: ctmc currentState isNil.
	^ctmc 
]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testCreateCTMC [

<gtExample>
| ctmc1 ctmc2 |

ctmc1 := self createCTMCWithTwoStates.
ctmc2 := self otherWayToCreateCTMCWithTwoStates.


self assert: (ctmc1 class  = K2CTMC).
self assert: (ctmc2 class  = K2CTMC)

]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testCreateCTMCInTwoDifferentWaysIsSame [

<gtExample>
| ctmc1 ctmc2|

ctmc1 := self createCTMCWithTwoStates.
ctmc2 := self otherWayToCreateCTMCWithTwoStates.

self assert: (ctmc1 class) equals: ctmc2 class.

]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testNumberOfStatesofCTMC [

<gtExample>
| ctmc |

ctmc :=self createCTMCWithTwoStates.

self assert: (ctmc states size)  equals: 2.
^ctmc

]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testRateOfCTMC [
<gtExample>
| ctmc |

ctmc := self createCTMCWithTwoStates .

self assert: (ctmc probabilityFrom: 1 to: 1)  equals: -0.4.
self assert: (ctmc probabilityFrom: 1 to: 2)  equals: 0.4.
self assert: (ctmc probabilityFrom: 2 to: 1)  equals: 0.7.
self assert: (ctmc probabilityFrom: 2 to: 2)  equals: -0.7.

^ctmc
]

{ #category : #tests }
K2CMTCWithTwoStatesTest >> testSumColumnsRateOfCTMCisZero [
<gtExample>
| ctmc |

ctmc := self createCTMCWithTwoStates .

self assert: ((ctmc probabilityFrom: 1 to: 1) + (ctmc probabilityFrom: 1 to: 2))  equals: 0.
self assert: ((ctmc probabilityFrom: 2 to: 1) + (ctmc probabilityFrom: 2 to: 2)) equals: 0.

^ctmc
]
