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
		| mid deb end element|
		
		element := ((0.0 to: 1.0) atRandom) asFloat.
		deb := 0.0.
		end := (frequencies size) - 1.
		mid := (deb + end)/2.
		[deb < end ] whileTrue: [ 
					((frequencies at: element) == element) 
							ifTrue: [^element].
										
					((frequencies at: element) > element)
							ifTrue: [ end := element - 1 ].
							
					((frequencies at: element) < element)
							ifFalse: [ deb := element + 1 ].
							
					mid := (deb + end)/2.
										
					^deb					
						 ]
							
							
		 
			
		
		
]
