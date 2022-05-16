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
	#category : #'Kendrick2-CTMC-Core'
}

{ #category : #accessing }
K2CTMCState >> name [
	^name
]

{ #category : #accessing }
K2CTMCState >> name: anObject [
	name := anObject 
]
