"
A KEEvent is an event generated from an ODE of epidemiological model.

Instance Variables
	fromStatus:		<Symbol>
	rate:		<KEExpression>
	toStatus:		<Symbol>

fromStatus
	- The current status taken by the event

rate
	- The expression represent the probabiity that the event will be occured

toStatus
	- The status after event executed

"
Class {
	#name : #KEEvent,
	#superclass : #KEEntity,
	#instVars : [
		'rate',
		'fromStatus',
		'toStatus'
	],
	#category : #'Kendrick-Core-MM1'
}

{ #category : #accessing }
KEEvent >> addOneIndividualTo: aStatus [
	toStatus := aStatus
]

{ #category : #accessing }
KEEvent >> findEventWithOppositeRateIn: eventList [
	^ eventList detect: [ :event | event rate negated = rate ] ifNone: [ nil ]
]

{ #category : #accessing }
KEEvent >> findEventWithSameActionsIn: eventList [
	^ eventList
		detect:
			[ :event | (event fromStatus = self fromStatus) & (event toStatus = self toStatus) ] 
		ifNone: [ nil ]
]

{ #category : #accessing }
KEEvent >> fromStatus [
	^ fromStatus
]

{ #category : #accessing }
KEEvent >> fromStatus: anObject [
	fromStatus := anObject
]

{ #category : #accessing }
KEEvent >> hasAnEventWithOppositeRateIn: eventList [
	^ eventList anySatisfy: [ :event | event rate negated = self rate ]
]

{ #category : #accessing }
KEEvent >> hasAnEventWithSameActionsIn: eventList [
	^ eventList anySatisfy: [ :event | event fromStatus = self fromStatus & (event toStatus = self toStatus) ]
]

{ #category : #initialization }
KEEvent >> initialize [
	super initialize.
	toStatus := #empty.
	fromStatus := #empty
]

{ #category : #accessing }
KEEvent >> mapStatusWith: anEvent [
	"This function will map fromStatus and toStatus to ones of anEvent"
	(fromStatus = #empty) & (anEvent fromStatus ~= #empty) ifTrue: [ fromStatus := anEvent fromStatus ].
	(toStatus = #empty) & (anEvent toStatus ~= #empty) ifTrue: [ toStatus := anEvent toStatus ]
]

{ #category : #printing }
KEEvent >> printOn: aStream [
	aStream
		nextPutAll: fromStatus asString;
		nextPutAll: ' -> ';
		nextPutAll: toStatus asString;
		nextPutAll: ' = ';
		nextPutAll: rate asString
]

{ #category : #accessing }
KEEvent >> rate [
	^ rate
]

{ #category : #accessing }
KEEvent >> rate: aKEExpression [
	rate := aKEExpression
]

{ #category : #accessing }
KEEvent >> removeOneIndividualFrom: aStatus [
fromStatus := aStatus
]

{ #category : #accessing }
KEEvent >> toStatus [
	^ toStatus
]

{ #category : #accessing }
KEEvent >> toStatus: anObject [
	toStatus := anObject
]
