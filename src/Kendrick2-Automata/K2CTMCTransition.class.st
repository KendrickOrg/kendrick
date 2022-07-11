"
This class define the transition of CTMC
"
Class {
	#name : #K2CTMCTransition,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'rate'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #accessing }
K2CTMCTransition >> from [
	^from
]

{ #category : #accessing }
K2CTMCTransition >> from: aState [

	from := aState
]

{ #category : #accessing }
K2CTMCTransition >> rate [

	^ rate
]

{ #category : #accessing }
K2CTMCTransition >> rate: aFloat [

	rate := aFloat 
]

{ #category : #accessing }
K2CTMCTransition >> to [
	^to
]

{ #category : #accessing }
K2CTMCTransition >> to: aState [

	to := aState
]
