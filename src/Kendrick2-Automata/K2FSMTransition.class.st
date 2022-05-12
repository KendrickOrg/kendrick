Class {
	#name : #K2FSMTransition,
	#superclass : #Object,
	#instVars : [
		'name',
		'from',
		'to'
	],
	#category : #'Kendrick2-Automata'
}

{ #category : #'instance creation' }
K2FSMTransition class >> from: aState1 to: aState2 named: aString [

	^ self new
		  from: aState1;
		  to: aState2;
		  name: aString;
		  yourself
]

{ #category : #'instance creation' }
K2FSMTransition class >> named: aString [

	^ self new
		  name: aString;
		  yourself
]

{ #category : #accessing }
K2FSMTransition >> from [ 
^ from
]

{ #category : #accessing }
K2FSMTransition >> from: aState [

from := aState
]

{ #category : #accessing }
K2FSMTransition >> name [

	^ name
]

{ #category : #accessing }
K2FSMTransition >> name: aSymbol [

	name := aSymbol
]

{ #category : #accessing }
K2FSMTransition >> to [ ^ to
]

{ #category : #accessing }
K2FSMTransition >> to: aState [

	to := aState
]
