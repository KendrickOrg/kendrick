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
| ctmc |

ctmc :=self createCTMCWithTwoStates .

self assert: (ctmc class  = K2CTMC).
^ctmc
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