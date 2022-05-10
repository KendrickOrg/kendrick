Class {
	#name : #K2Transition,
	#superclass : #Object,
	#instVars : [
		'name',
		'from',
		'to'
	],
	#category : #'K2-Automata'
}

{ #category : #'instance creation' }
K2Transition class >> named: aString [

	^ self new
		  name: aString;
		  yourself
]

{ #category : #accessing }
K2Transition >> from [ 
^ from
]

{ #category : #accessing }
K2Transition >> from: aState [

from := aState
]

{ #category : #accessing }
K2Transition >> name [

	^ name
]

{ #category : #accessing }
K2Transition >> name: aSymbol [

	name := aSymbol
]

{ #category : #accessing }
K2Transition >> to [ ^ to
]

{ #category : #accessing }
K2Transition >> to: aState [

	to := aState
]
