Class {
	#name : #K2StateTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2StateTest >> testStateIsNamed [

	| state |
	state := K2State named: #A.
	self assert: state name equals: #A
]
