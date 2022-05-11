"
We create a class K2State with 3 instance variables name, isInitialState and isFinalState representing respectively the name, the fact that the state can be initial and so that it can be in a final state
"
Class {
	#name : #K2State,
	#superclass : #Object,
	#instVars : [
		'name',
		'isInitialState',
		'isFinalState'
	],
	#category : #'K2-Automata'
}

{ #category : #'instance creation' }
K2State class >> named: aString [
	^ self new
		name: aString;
		yourself

]

{ #category : #accessing }
K2State >> isInitialState [ 
	^true
]

{ #category : #accessing }
K2State >> name [
^ name
]

{ #category : #accessing }
K2State >> name: aSymbol [

name := aSymbol
]
