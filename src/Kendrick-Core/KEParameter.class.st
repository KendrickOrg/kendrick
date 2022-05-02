"
A KEParameter represents a parameter in the context of an epidemiological model.

Instance Variables
	expression:		<Object>
	symbol:		<Symbol>

expression
	- is a KEExpression or a Block

symbol
	- name of the parameter

"
Class {
	#name : #KEParameter,
	#superclass : #KEEntity,
	#instVars : [
		'symbol',
		'expression'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #accessing }
KEParameter >> expression [
	^ expression
]

{ #category : #accessing }
KEParameter >> expression: anExpression [
	expression := anExpression
]

{ #category : #printing }
KEParameter >> printOn: aStream [
	aStream nextPutAll: expression asString
]

{ #category : #accessing }
KEParameter >> symbol [
	^ symbol
]

{ #category : #accessing }
KEParameter >> symbol: aSymbol [
	symbol := aSymbol
]

{ #category : #accessing }
KEParameter >> value: model [
	^ expression value: model
]
