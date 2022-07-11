Class {
	#name : #K2DTMCTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2DTMCTest >> testSteadyStates [

	| automata |
	automata := K2DTMC
		            newFromArray: #( #( 0.5 0.5 ) #( 1.0 0.0 ) )
		            initialState: 1.
	self assert: automata steadyStates closeTo:{2/3. 1/3}.
	
]
