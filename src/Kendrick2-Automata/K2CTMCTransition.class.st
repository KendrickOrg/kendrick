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

{ #category : #accessing }
K2CTMCTransition >> from [
	^from
]

{ #category : #accessing }
K2CTMCTransition >> from: anObject [
	from:= anObject 
]

{ #category : #accessing }
K2CTMCTransition >> rate [

	^ probability
]

{ #category : #accessing }
K2CTMCTransition >> rate: aFloat [

	probability := aFloat 
]

{ #category : #accessing }
K2CTMCTransition >> to [
	^to
]

{ #category : #accessing }
K2CTMCTransition >> to: anObject [
 	to:= anObject 
]
