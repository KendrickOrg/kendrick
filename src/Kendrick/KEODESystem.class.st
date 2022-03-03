Class {
	#name : #KEODESystem,
	#superclass : #Object,
	#instVars : [
		'initialState',
		'bindings',
		'equations'
	],
	#category : #'Kendrick-Tests-MM'
}

{ #category : #initialization }
KEODESystem >> equations: aStringArray [

	equations := aStringArray collect: [ :each | 
		             each parseAsAnExpression ].
	
]

{ #category : #initialization }
KEODESystem >> initialState: aVector [

	initialState := aVector.
	self updateBindingsWithState: aVector
]

{ #category : #initialization }
KEODESystem >> initialize [

bindings := Dictionary new
]

{ #category : #initialization }
KEODESystem >> state: aState time: anInteger [

	| state |
	bindings at: #time put: anInteger.

	state := equations collect: [ :each | 
		         each expression evaluateWithParameters: bindings ].
	self updateBindingsWithState: state.
	^ state
]

{ #category : #initialization }
KEODESystem >> updateBindingsWithState: aVector [ 

equations
		with: aVector
		do: [ :eq :value | bindings at: eq variable symbol put: value ]
]
