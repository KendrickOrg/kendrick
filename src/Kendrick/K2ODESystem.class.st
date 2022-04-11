Class {
	#name : #K2ODESystem,
	#superclass : #Object,
	#instVars : [
		'bindings',
		'equations'
	],
	#category : #'Kendrick-Meta-Modele'
}

{ #category : #accessing }
K2ODESystem >> at: name put: value [

bindings at: name put: value
]

{ #category : #accessing }
K2ODESystem >> equations: aStringArray [

	equations := aStringArray collect: [ :each | 
		             each parseAsAnExpression ].
]

{ #category : #initialization }
K2ODESystem >> initialState: aVector [

	self updateBindingsWithState: aVector
]

{ #category : #initialization }
K2ODESystem >> initialize [

bindings := Dictionary new
]

{ #category : #accessing }
K2ODESystem >> state: aState time: anInteger [


	bindings at: #time put: anInteger.
	self updateBindingsWithState: aState.
	^ equations collect: [ :each | 
		         each expression evaluateWithParameters: bindings ]
]

{ #category : #initialization }
K2ODESystem >> updateBindingsWithState: aVector [
"Update values of variables in the order of the equations provided by user"
	equations
		with: aVector
		do: [ :eq :value | bindings at: eq variable symbol put: value ]
]
