Class {
	#name : #KEEventTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEEventTest >> testCompareActionsOf2Events [
	| e1 e2 |
    e1 := KEEvent new.
    e1 updateCardinalityOf:#S by: -1.
    e1 updateCardinalityOf:#I by: 1.
    e2 := KEEvent new.
    e2 updateCardinalityOf:#I by: 1.
    e2 updateCardinalityOf:#S by: -1.
 
    self assert: (e1 updateCardinalityOf: #S) equals: (e2 updateCardinalityOf:#S).
    self assert: (e1 updateCardinalityOf: #I) equals: (e2 updateCardinalityOf:#I)
]

{ #category : #tests }
KEEventTest >> testCreateAnEventThatAddAnIndividualFromStatusS [
	|e|
	e := KEEvent new.
	e addOneIndividualTo: #S.
	self assert: (e actions at: #S) equals: 1.

]

{ #category : #tests }
KEEventTest >> testCreateAnEventThatRemoveAnIndividualFromStatusS [
	|e|
	e := KEEvent new.
	e removeOneIndividualFrom: #S.
	self assert: (e actions at: #S) equals: -1.

]

{ #category : #tests }
KEEventTest >> testEventsWithOppositeRate [

|  e1 e2 si s i beta minusBetaSI betaSI listEvents |
e1 := KEEvent new.
e2 := KEEvent new.

s := (KEVariable new) symbol: #S.
i := (KEVariable new) symbol: #I.
beta := (KEVariable new) symbol:#beta.

minusBetaSI := (KEUnaryExpression new).
si := KEBinaryExpression new.
si op: #*; leftHandSide: s; rightHandSide: i.
betaSI := KEBinaryExpression new.
betaSI op:#*; leftHandSide: beta; rightHandSide: si. 
minusBetaSI op:#- ; expression: betaSI..

e1 rate: minusBetaSI normalize.
e2 rate: betaSI normalize.

listEvents := OrderedCollection new.
listEvents add: e1.
self assert: true equals: (e2 hasAnEventWithOppositeRateIn: listEvents)
]

{ #category : #tests }
KEEventTest >> testEventsWithSameActions [

| e1 e2 listEvents |
e1 := KEEvent new.
e2 := KEEvent new.

e1 actions at: #S put: 1; at: #I put: -1.
e2 actions at: #I put: -1; at: #S put: 1.

listEvents := OrderedCollection new.
listEvents add: e1.
self assert: true equals: (e2 hasAnEventWithSameActionsIn: listEvents)
]
