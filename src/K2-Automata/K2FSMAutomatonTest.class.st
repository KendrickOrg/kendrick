Class {
	#name : #K2FSMAutomatonTest,
	#superclass : #TestCase,
	#category : #'K2-Automata'
}

{ #category : #tests }
K2FSMAutomatonTest >> testANewAutomatonHasNoStatesExample [

	<gtExample>
	| a |
	a := K2FSMAutomaton new.
	self assert: a states isEmpty.
	^ a
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoFinalStatesExample [

	<gtExample>
	|a|
	a := K2FSMAutomaton new.
	self assert: a finalStates  isEmpty.
	^a
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoInitialStateExample [

	<gtExample>
	|a|
	a := K2FSMAutomaton new.
	self assert: a initialState isEmpty.
	^a
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoTransitionsExample [

	<gtExample>
	|a|
	a := K2FSMAutomaton new.
	self assert: a transitions isEmpty.
	^a
	
]
