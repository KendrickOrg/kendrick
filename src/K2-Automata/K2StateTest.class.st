Class {
	#name : #K2StateTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2StateTest >> testStateIsNamedExample [
	<gtExample>
	| state |
	state := K2State named: #A.
	self assert: state name equals: #A.
	^state
]
