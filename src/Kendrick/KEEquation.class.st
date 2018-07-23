"
A KEEquation is an ordinary differential equation.

Instance Variables
	expression:		<KEExpression>
	tVariable:		<KEVariable>
	variable:		<KEVariable>

expression
	- The right hand side of the equation

tVariable
	- The time variable

variable
	- The differential variable of the equation

"
Class {
	#name : #KEEquation,
	#superclass : #KEEntity,
	#instVars : [
		'variable',
		'tVariable',
		'expression'
	],
	#category : #'Kendrick-Core'
}

{ #category : #evaluating }
KEEquation >> evaluateWithModel: model [
	^ self expression evaluateWithModel: model
]

{ #category : #accessing }
KEEquation >> expression [
	^ expression
]

{ #category : #accessing }
KEEquation >> expression: anExpression [
	expression := anExpression
]

{ #category : #'as yet unclassified' }
KEEquation >> generateEvents [
	"This function will get all events generated from the current equation and depending on the sign of rate expression, create actions for each event, for each population of the model"
	|eventList|
	eventList := expression generateEvents.
	eventList do: [ :each|
		(each rate sign positive)
		ifTrue: [ 
			each addOneIndividualTo: (variable symbol).
			each toStatus: (variable symbol) ]
		ifFalse: [ 
			each removeOneIndividualFrom: (variable symbol).
			each fromStatus: (variable symbol) ]
		 ].
	^ eventList

]

{ #category : #'as yet unclassified' }
KEEquation >> generateEvents: population [
	"This function will get all events generated from the current equation and depending on the sign of rate expression, create actions for each event, for each population of the model"
	|eventList|
	eventList := expression generateEvents: population.
	eventList do: [ :each|
		(each rate sign positive)
		ifTrue: [ 
			each addOneIndividualTo: (variable symbol).
			each toStatus: (variable symbol) ]
		ifFalse: [ 
			each removeOneIndividualFrom: (variable symbol).
			each fromStatus: (variable symbol) ]
		 ].
	^ eventList

]

{ #category : #printing }
KEEquation >> printOn: aStream [
	aStream
		nextPutAll: variable asString;
		nextPutAll: ':';
		nextPutAll: tVariable asString;
		nextPutAll: '=';
		nextPutAll: expression asString
]

{ #category : #accessing }
KEEquation >> tVariable [
	^ tVariable
]

{ #category : #accessing }
KEEquation >> tVariable: aVariable [
	tVariable := aVariable
]

{ #category : #accessing }
KEEquation >> variable [
	^ variable
]

{ #category : #accessing }
KEEquation >> variable: aVariable [
	variable := aVariable
]
