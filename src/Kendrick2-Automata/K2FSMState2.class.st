"
We create a class K2State with 3 instance variables name, isInitialState and isFinalState representing respectively the name, the fact that the state can be initial and so that it can be in a final state
"
Class {
	#name : #K2FSMState2,
	#superclass : #Object,
	#instVars : [
		'name',
		'isInitialState',
		'isFinalState'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
K2FSMState2 class >> named: aString [
	^ self new
		name: aString;
		yourself

]

{ #category : #accessing }
K2FSMState2 >> beFinal [

self become: (K2FSMFinalState named: self name)
]

{ #category : #accessing }
K2FSMState2 >> beInitial [

	self become: (K2FSMInitialState named: self name)
]

{ #category : #accessing }
K2FSMState2 >> name [
^ name
]

{ #category : #accessing }
K2FSMState2 >> name: aSymbol [

name := aSymbol
]
