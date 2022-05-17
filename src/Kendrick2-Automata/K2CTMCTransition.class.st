"
This class define the transition of CTMC
"
Class {
	#name : #K2CTMCTransition,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'probability'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #converting }
K2CTMCTransition >> asString [
	^ 'Transition from ' , (from name), 'to ', (to name), 'probability ', (probability asString).
]

{ #category : #accessing }
K2CTMCTransition >> from [
	^from
]

{ #category : #accessing }
K2CTMCTransition >> from: anObject [
	from:= anObject 
]

{ #category : #accessing }
K2CTMCTransition >> probability [
	^ probability
]

{ #category : #accessing }
K2CTMCTransition >> probability: anObject [
	probability := anObject 
]

{ #category : #accessing }
K2CTMCTransition >> to [
	^to
]

{ #category : #accessing }
K2CTMCTransition >> to: anObject [
 	to:= anObject 
]
