Class {
	#name : #K2FSMAutomatonTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata'
}

{ #category : #tests }
K2FSMAutomatonTest >> example1 [

	<gtExample>
	| automaton initial final state firstTransition secondTransition selfTransition |
	automaton := K2FSMAutomaton named: 'Automata'.
	initial := K2FSMInitialState named: 'initial'.
	(final := K2FSMState named: 'final') beFinal.
	state := K2FSMState named: 'state'.
	firstTransition := K2FSMTransition
		                   from: initial
		                   to: state
		                   named: 'first'.
	secondTransition := K2FSMTransition
		                    from: state
		                    to: final
		                    named: 'second'.
	selfTransition := K2FSMTransition from: state to: state named: 'self'
]

{ #category : #tests }
K2FSMAutomatonTest >> testANewAutomatonHasNoStates [

	<gtExample>
	| automaton |
	automaton := K2FSMAutomaton new.
	self assert: automaton states isEmpty.
	^ automaton
]

{ #category : #tests }
K2FSMAutomatonTest >> testName [

	
	<gtExample>
	| state |
	state := K2FSMAutomaton named:'A'.
	self assert: state name equals: 'A'.
	^ state
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoFinalStates [

	<gtExample>
	| automaton |
	automaton := K2FSMAutomaton new.
	self assert: automaton finalStates isEmpty.
	^ automaton
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoInitialState [

	<gtExample>
	| automaton |
	automaton := K2FSMAutomaton new.
	self assert: automaton initialState isEmpty.
	^ automaton
]

{ #category : #tests }
K2FSMAutomatonTest >> testNewAutomatonHasNoTransitions [

	<gtExample>
	| automaton |
	automaton := K2FSMAutomaton new.
	self assert: automaton transitions isEmpty.
	^ automaton
]
