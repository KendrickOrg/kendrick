Class {
	#name : #KEODESystem,
	#superclass : #Object,
	#instVars : [
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
"Update values of variables in the order of the equations provided by user"
	equations
		with: aVector
		do: [ :eq :value | bindings at: eq variable symbol put: value ]
]
