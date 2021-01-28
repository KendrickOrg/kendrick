Class {
	#name : #BisectingSearchProportionalSelection,
	#superclass : #ProportionalSelection,
	#instVars : [
		'total',
		'cumulativeDensityPoint'
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
	cumulativeDensityPoint := nil.
	total := 0
]

{ #category : #converting }
BisectingSearchProportionalSelection >> normalize [
	| accumulator |
	total := frequencies sum.
	cumulativeDensityPoint := nil.
	accumulator := 0.
	frequencies
		doWithIndex: [ :i | 
			accumulator := (accumulator + i) / total asFloat.
			cumulativeDensityPoint add: accumulator ]
]

{ #category : #examples }
BisectingSearchProportionalSelection >> sample [
	^ cumulativeDensityPoint atRandom 
	
]
