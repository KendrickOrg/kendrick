"
Define the state class of `CTMC`
"
Class {
	#name : #K2CTMCState,
	#superclass : #Object,
	#instVars : [
		'name',
		'transitionArray'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #initialization }
K2CTMCState >> initialize [
	super initialize.
	name := ''.
	transitionArray := OrderedCollection new.
]

{ #category : #accessing }
K2CTMCState >> name [
	^name
]

{ #category : #accessing }
K2CTMCState >> name: anObject [
	name := anObject 
]

{ #category : #accessing }
K2CTMCState >> nextState [
	| randomNum probs|
	randomNum  := (Random new)next .
	probs := transitionArray collect: [ :e | e probability  ].
	probs withIndexDo: [ :e :i | randomNum  := randomNum  - e. (randomNum  < 0) ifTrue: [ ^ (transitionArray at: i) to ] ]
]

{ #category : #accessing }
K2CTMCState >> transitionArray [
	^transitionArray 
]

{ #category : #accessing }
K2CTMCState >> transitionArray: anObject [
	transitionArray := anObject 
]
