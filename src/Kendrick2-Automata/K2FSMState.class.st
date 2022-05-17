"
We create a class K2State with 3 instance variables name, isInitialState and isFinalState representing respectively the name, the fact that the state can be initial and so that it can be in a final state
"
Class {
	#name : #K2FSMState,
	#superclass : #Object,
	#instVars : [
		'name',
		'isInitialState',
		'isFinalState'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
K2FSMState class >> named: aString [
	^ self new
		name: aString;
		yourself

]

{ #category : #accessing }
K2FSMState >> beFinal [

self become: (K2FSMFinalState named: self name)
]

{ #category : #accessing }
K2FSMState >> beInitial [

	self become: (K2FSMInitialState named: self name)
]

{ #category : #accessing }
K2FSMState >> name [
^ name
]

{ #category : #accessing }
K2FSMState >> name: aSymbol [

name := aSymbol
]
