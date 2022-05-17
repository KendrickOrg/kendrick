"
I represent a finite state machine (FSM).
A subset of my states are final states.

"
Class {
	#name : #K2FSMAutomaton,
	#superclass : #K2Automaton,
	#instVars : [
		'finalStates',
		'transitions',
		'initialStates'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
K2FSMAutomaton class >> named: aString [

	^ self new
		  name: aString;
		  yourself
]

{ #category : #accessing }
K2FSMAutomaton >> addAll: aCollectionOfStates [

	states addAll: aCollectionOfStates.
	finalStates addAll:
		(aCollectionOfStates select: [ :each | 
			 each class == K2FSMFinalState ]).
	initialState := (aCollectionOfStates select: [ :each | 
		                each class == K2FSMInitialState ]) first
]

{ #category : #accessing }
K2FSMAutomaton >> finalStates [
	^finalStates 
]

{ #category : #accessing }
K2FSMAutomaton >> initialState [ 
	^initialState 
]

{ #category : #accessing }
K2FSMAutomaton >> initialize [

	states := OrderedCollection new.
	transitions := OrderedCollection new.
	initialState := nil.
	finalStates := OrderedCollection new
]

{ #category : #accessing }
K2FSMAutomaton >> name [

	^ name
]

{ #category : #accessing }
K2FSMAutomaton >> name: aString [

name := aString
]

{ #category : #accessing }
K2FSMAutomaton >> states [ 
^states
]

{ #category : #accessing }
K2FSMAutomaton >> transitions [
	^transitions 
]
