"
A KEIndividual represents an individual in the system. Each individual has its own attributes such as: currentStatus, nextStatus, position, age, ...

Instance Variables
	attributes:		<Dictionary>

attributes
	- A list of attributes of an individual. An attribute could be simple with symbol and value or may be an instance of KEAttribute that defines the effect on probability of contact of this individual to others.

"
Class {
	#name : #KEIndividual,
	#superclass : #KEEntity,
	#instVars : [
		'attributes',
		'currentStatus',
		'nextStatus'
	],
	#category : 'Kendrick-IBM-Core'
}

{ #category : #meta }
KEIndividual class >> annotation [
	<MSEClass: #Individual super: #KEEntity >
	<package: #KE>
	^ self
]

{ #category : #accessing }
KEIndividual >> attributes [
	^ attributes
]

{ #category : #copying }
KEIndividual >> copy [
	|newInstance|
	newInstance := self class new.
	newInstance attributes addAll: (self attributes).
	^ newInstance
]

{ #category : #accessing }
KEIndividual >> currentStatus [
	^ currentStatus
]

{ #category : #accessing }
KEIndividual >> currentStatus: aDictionary [
	currentStatus := aDictionary
]

{ #category : #information }
KEIndividual >> distanceTo: other [
	|x y|
	x := self position.
	y := other position.
	^ ((x - y) raisedTo: 2) sum
]

{ #category : #accessing }
KEIndividual >> id [
	^ attributes at: #id ifAbsent: [ nil ]
]

{ #category : #accessing }
KEIndividual >> id: id [
	attributes at: #id put: id
]

{ #category : #initialization }
KEIndividual >> initialize [
	super initialize.
	attributes := Dictionary new.
	attributes at: #alive put: true
]

{ #category : #testing }
KEIndividual >> isAlive [
	^ self attributes at: #alive
]

{ #category : #testing }
KEIndividual >> isInfected [
	^ self isAlive and: [ (self currentStatus at: #status) = #I ]
]

{ #category : #accessing }
KEIndividual >> nextStatus [
	^ nextStatus
]

{ #category : #accessing }
KEIndividual >> nextStatus: aDictionary [
	nextStatus := aDictionary
]

{ #category : #accessing }
KEIndividual >> position [
	^ attributes at: #position ifAbsent: [ nil ]
]

{ #category : #accessing }
KEIndividual >> position: position [
	attributes at: #position put: position
]

{ #category : #printing }
KEIndividual >> printOn: aStream [
	aStream nextPutAll: (self currentStatus) asString, '-->', (self nextStatus) asString

]

{ #category : #'as yet unclassified' }
KEIndividual >> updateAttributes: aDictionary [
	aDictionary keysAndValuesDo: [ :k :v| self attributes at: k put: v ]
	
]
