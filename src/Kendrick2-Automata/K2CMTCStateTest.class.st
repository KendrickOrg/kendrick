Class {
	#name : #K2CMTCStateTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2CMTCStateTest >> testName [

	<gtExample>
	| state |
	state := K2CTMCState named: #A.
	self assert: state name equals: #A.
	^ state
]
