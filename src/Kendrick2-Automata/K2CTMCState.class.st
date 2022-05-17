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
	transitionArray := OrderedCollection new
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
K2CTMCState >> step [

	| randomNum probs |
	randomNum := Random new next.
	probs := transitionArray collect: [ :e | e probability ].
	probs withIndexDo: [ :e :i | 
		randomNum := randomNum - e.
		randomNum < 0 ifTrue: [ ^ (transitionArray at: i) to ] ]
]

{ #category : #accessing }
K2CTMCState >> transitionArray [
	^transitionArray 
]

{ #category : #accessing }
K2CTMCState >> transitionArray: anArray [

	transitionArray := anArray
]
