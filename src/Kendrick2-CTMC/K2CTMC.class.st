"
The principal class of `CTMC`
"
Class {
	#name : #K2CTMC,
	#superclass : #Object,
	#instVars : [
		'states',
		'currentState'
	],
	#category : #'Kendrick2-CTMC-Core'
}

{ #category : #accessing }
K2CTMC >> states [
	^ states
]

{ #category : #accessing }
K2CTMC >> states: anObject [
	states := anObject
]
