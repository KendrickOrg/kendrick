Class {
	#name : #ProportionalSelection,
	#superclass : #Object,
	#instVars : [
		'frequencies'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'instance creation' }
ProportionalSelection class >> from: aCollection [ [
	^ (self new) initialize: (aCollection size); from: aCollection ] 
]

{ #category : #accessing }
ProportionalSelection >> at: index [ [
	^ frequencies at: index
]
]

{ #category : #accessing }
ProportionalSelection >> at:index put:value [ [

self subclassResponsibility 
]

]

{ #category : #'instance creation' }
ProportionalSelection >> from: aCollection [ [

1 to: aCollection size do:[:i|
	self at: i put: (aCollection at:i)
	]
]
]

{ #category : #initialization }
ProportionalSelection >> initialize: size [ [
	frequencies := Array new: size withAll:0
]

]

{ #category : #converting }
ProportionalSelection >> normalize [ [ 

self subclassResponsibility 
]
]

{ #category : #examples }
ProportionalSelection >> sample [ [ 
self subclassResponsibility 
]
]
