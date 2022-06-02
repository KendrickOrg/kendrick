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

	| randomNum rates |
	randomNum := Random new next.
	rates := transitionArray collect: [ :each | each rate ].
	rates withIndexDo: [ :each :index | 
		randomNum := randomNum - each.
		randomNum < 0 ifTrue: [ ^ (transitionArray at: index) to ] ]
]

{ #category : #accessing }
K2CTMCState >> transitionArray [
	^transitionArray 
]

{ #category : #accessing }
K2CTMCState >> transitionArray: anArray [

	transitionArray := anArray
]
