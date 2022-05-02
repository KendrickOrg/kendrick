Class {
	#name : #KEODESystem,
	#superclass : #Object,
	#instVars : [
		'bindings',
		'equations'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #initialization }
KEODESystem >> at: name put: value [

bindings at: name put: value
]

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


	bindings at: #time put: anInteger.
	self updateBindingsWithState: aState.
	^ equations collect: [ :each | 
		         each expression evaluateWithParameters: bindings ]
]

{ #category : #initialization }
KEODESystem >> updateBindingsWithState: aVector [
"Update values of variables in the order of the equations provided by user"
	equations
		with: aVector
		do: [ :eq :value | bindings at: eq variable symbol put: value ]
]
