Class {
	#name : #K2CTMCTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2CTMCTest >> testSteadyStates [

	| automata |
	automata := K2CTMC
		            newFromArray:
		            #( #( -1 1 0 0 ) #( 5 -10 5 0 ) #( 0 8 -12 4 )
		               #( 0 0 10 -10 ) )
		            initialState: 1.
	automata step.
	self assert: (#( 1 2) includes: (automata currentState))
]

{ #category : #tests }
K2CTMCTest >> testStep1 [

	| automata |
	automata := K2CTMC
		            newFromArray:
		            #( #(0) )
		            initialState: 1.
	automata step.
	self assert: (automata currentState) equals:1
]
