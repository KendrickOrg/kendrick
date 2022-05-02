"
A KEIndexedVariable is a variable in an expression with sum function, a variable followed by a squarebrace.

Instance Variables
	indexList:		<OrderedCollection>

indexList
	- a list of squarebrace expressions following the variable for example: [ i ][j-1][k-2]...

"
Class {
	#name : #KEIndexedVariable,
	#superclass : #KEVariable,
	#instVars : [
		'indexList'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #comparing }
KEIndexedVariable >> = anExpression [
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
anExpression isAnIndexedVariable
	ifTrue:[^(self symbol = anExpression symbol) and:
		[ self indexList = anExpression indexList ]
		].
^false
]

{ #category : #adding }
KEIndexedVariable >> addAllIndex: anObjectList [
	indexList addAll: anObjectList
		
	
]

{ #category : #adding }
KEIndexedVariable >> addIndex: anObject [
	indexList addLast: anObject
		
	
]

{ #category : #'accessing-sequenceable' }
KEIndexedVariable >> atIndex: indexNumber [
	"This function will return a variable or an expression who represents an index in ODE equation"
	^ indexList at: indexNumber
		
	
]

{ #category : #'as yet unclassified' }
KEIndexedVariable >> evaluateWithModel: aModel [
	|indexValues x subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		"currentPID := aModel currentPopulationID."
		subPop := aModel currentSubPopulation.
		subPop populationID = indexValues first 
		ifTrue: [ 
		 	^ (subPop at: symbol) currentNbIndividuals
			]
		ifFalse: [ ^ ((subPop parent at: (indexValues first)) at: symbol) currentNbIndividuals ].
		].
	indexValues do: [ :each| x := (x at: each) ].
	^ x
]

{ #category : #accessing }
KEIndexedVariable >> indexList [
	^ indexList 
		
	
]

{ #category : #initialization }
KEIndexedVariable >> initialize [
	super initialize.
	indexList := OrderedCollection new.
		
	
]

{ #category : #testing }
KEIndexedVariable >> isAnIndexedVariable [

^true
]

{ #category : #printing }
KEIndexedVariable >> printOn: aStream [
	aStream nextPutAll: symbol asString.
	indexList
		do: [ :each | 
			aStream
				nextPutAll: '[' , each asString;
				nextPutAll: ']' ]
]

{ #category : #evaluating }
KEIndexedVariable >> removeIndexedVariable [
	^ (KEVariable new symbol: symbol)
		
	
]

{ #category : #removing }
KEIndexedVariable >> removeVariable: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"

	self symbol = aVariable symbol
		ifTrue: [ ^ nil ].
	^ self
]
