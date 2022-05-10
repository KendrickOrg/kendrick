Class {
	#name : #K2State,
	#superclass : #Object,
	#instVars : [
		'name'
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
K2State >> name [
^ name
]

{ #category : #accessing }
K2State >> name: aSymbol [

name := aSymbol
]
