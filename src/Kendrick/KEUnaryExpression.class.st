"
A KEUnaryExpression is a negated expression.

Instance Variables
	expression:		<KEExpression>
	op:		<Symbol>

expression
	- The expression with no sign

op
	- The sign of the expression (#-)

"
Class {
	#name : #KEUnaryExpression,
	#superclass : #KEExpression,
	#instVars : [
		'op',
		'expression'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KEUnaryExpression class >> op: aSymbol [

^ super new op:aSymbol
]

{ #category : #comparing }
KEUnaryExpression >> = anExpression [
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
(anExpression isUnaryExpression) ifTrue: [
	^(self expression = anExpression expression).
]
ifFalse:[^false]
]

{ #category : #printing }
KEUnaryExpression >> checkNil [
	^ expression isNil
]

{ #category : #'as yet unclassified' }
KEUnaryExpression >> evaluateWithModel: aModel [
	|value|
	value := expression evaluateWithModel: aModel.
	op = #- ifTrue:[^ value negated]
]

{ #category : #accessing }
KEUnaryExpression >> expression [
	^ expression
]

{ #category : #accessing }
KEUnaryExpression >> expression: anExpression [

expression := anExpression
]

{ #category : #'as yet unclassified' }
KEUnaryExpression >> generateEvents [
	|list e|
	(expression isUnaryExpression)|(expression isBinaryExpression) ifTrue: [
		|l|
		l := OrderedCollection new.
		list := expression generateEvents.
		list do:[:each|
			|oldRate|
			oldRate := each rate.
			each rate: ((KEUnaryExpression new) op: #-; expression: oldRate) normalize.
			l add: each.
			].
		^ l
		]
	ifFalse: [
		e := KEEvent new.
		e rate: self normalize.
		list add:e.		
		].
^ list
]

{ #category : #testing }
KEUnaryExpression >> isSeparable [
	^ (expression isSeparable)
]

{ #category : #testing }
KEUnaryExpression >> isUnaryExpression [
	^ true
]

{ #category : #testing }
KEUnaryExpression >> negated [

^expression
]

{ #category : #converting }
KEUnaryExpression >> normalize [
	|e|
	e := expression normalize.
	e isUnaryExpression ifTrue: [^ (e expression)] ifFalse: [^ ((KEUnaryExpression new) op: #-; expression: e)].
]

{ #category : #accessing }
KEUnaryExpression >> op [
	^ op
]

{ #category : #accessing }
KEUnaryExpression >> op: anOperator [
	op := anOperator
]

{ #category : #printing }
KEUnaryExpression >> printOn: aStream [
	aStream 
		nextPutAll: '-';
		nextPutAll: expression asString
]

{ #category : #removing }
KEUnaryExpression >> remove: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	|new|
	new := (KEUnaryExpression new) op: #-.
	new expression: (expression remove: aVariable).
	^ new
]

{ #category : #evaluating }
KEUnaryExpression >> removeIndexedVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	|new|
	new := self copy.
	new expression: (expression removeIndexedVariable).
	^ new
]

{ #category : #testing }
KEUnaryExpression >> sign [
	^ (op = #-)
		ifTrue: [^expression sign negated]
		ifFalse:[^expression sign]
]
