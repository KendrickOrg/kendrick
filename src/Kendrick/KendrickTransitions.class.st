Class {
	#name : #KendrickTransitions,
	#superclass : #Object,
	#instVars : [
		'eqAsSymExpr'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
KendrickTransitions >> convertToCompatibleBackendRepresentation [

	|transitions currentTransition|

	transitions := OrderedCollection new.
	currentTransition := nil.

	eqAsSymExpr  do: [ :token | 
		(token = #--> or: [ token = #-- ])
			ifTrue: [  
				"do nothing"
			] ifFalse: [ 
				token = #'.'
					ifTrue: [ transitions add: currentTransition. currentTransition := nil ]
					ifFalse: [ 
						currentTransition = nil 
							ifTrue: [ currentTransition := token ]
							ifFalse: [ currentTransition := currentTransition -> token ]  
					]
			]
	].

	^ transitions 

	
]

{ #category : #'as yet unclassified' }
KendrickTransitions >> with: symExpression [

	eqAsSymExpr := symExpression 
]
