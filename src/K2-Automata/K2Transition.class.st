Class {
	#name : #K2Transition,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'K2-Automata'
}

{ #category : #accessing }
K2Transition >> from [ 
^ from
]

{ #category : #accessing }
K2Transition >> from: aState [

from := aState
]

{ #category : #accessing }
K2Transition >> to [ ^ to
]

{ #category : #accessing }
K2Transition >> to: aState [

	to := aState
]
