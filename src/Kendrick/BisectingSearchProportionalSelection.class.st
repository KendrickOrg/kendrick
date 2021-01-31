Class {
	#name : #BisectingSearchProportionalSelection,
	#superclass : #ProportionalSelection,
	#instVars : [
		'total',
		'cumulativeDensityFunction'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #accessing }
BisectingSearchProportionalSelection >> at: index put: value [  
	
	total := total + value - frequencies at: index.
	frequencies at: index put: value
	

]

{ #category : #initialization }
BisectingSearchProportionalSelection >> initialize: size [
	super initialize: size.
	total := 0
]

{ #category : #converting }
BisectingSearchProportionalSelection >> normalize [
	| accumulator |
	total := frequencies sum.
	cumulativeDensityFunction := OrderedCollection new.
	accumulator := 0.
	frequencies
		do: [ :each | 
			accumulator := accumulator + (each / total) asFloat.
			cumulativeDensityFunction add: accumulator ]
]

{ #category : #examples }
BisectingSearchProportionalSelection >> sample [
	self shouldBeImplemented 
]
