"
Abstract class for proportional selection 

"
Class {
	#name : #ProportionalSelection,
	#superclass : #Object,
	#instVars : [
		'frequencies'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'instance creation' }
ProportionalSelection class >> from: aCollection [
	^ (self new) initialize: (aCollection size); from: aCollection
]

{ #category : #accessing }
ProportionalSelection >> at: index [
	^ frequencies at: index
]

{ #category : #accessing }
ProportionalSelection >> at:index put:value [

self subclassResponsibility 
]

{ #category : #accessing }
ProportionalSelection >> from: aCollection [
aCollection doWithIndex:[:each :i| self at: i put: each]
	 
]

{ #category : #initialize }
ProportionalSelection >> initialize: size [
	frequencies := Array new: size withAll:0
]

{ #category : #'as yet unclassified' }
ProportionalSelection >> normalize [ 

self subclassResponsibility 
]

{ #category : #accessing }
ProportionalSelection >> sample [ 
self subclassResponsibility 
]
