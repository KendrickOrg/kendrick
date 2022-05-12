Class {
	#name : #K2FSMStateTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata'
}

{ #category : #tests }
K2FSMStateTest >> testBeFinal [

	<gtExample>
	| state |
	state := K2FSMState named: #A.
	state beFinal.
	self assert: state class equals: K2FSMFinalState.
	^ state
]

{ #category : #tests }
K2FSMStateTest >> testBeInitial [

	<gtExample>
	| state |
	state := K2FSMState named: #A.
	state beInitial.
	self assert: state class equals: K2FSMInitialState.
	^ state
]

{ #category : #tests }
K2FSMStateTest >> testName [

	<gtExample>
	| state |
	state := K2FSMState named: #A.
	self assert: state name equals: #A.
	^ state
]
