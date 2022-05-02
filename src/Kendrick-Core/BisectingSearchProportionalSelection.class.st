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

{ #category : #'as yet unclassified' }
BisectingSearchProportionalSelection >> normalize [
	| accumulator |
	total := frequencies sum.
	accumulator := 0.
	cumulativeDensityFunction := frequencies collect:[:each| accumulator := accumulator + (each/total) asFloat]

]

{ #category : #accessing }
BisectingSearchProportionalSelection >> sample [
	| middle begin end value |
	value := Random new next.
	begin := 1.
	end := cumulativeDensityFunction size.
	[ begin <= end ]
		whileTrue: [ middle := begin + end quo: 2.
			(cumulativeDensityFunction at: middle) > value
				ifTrue: [ end := middle - 1 ]
				ifFalse: [ begin := middle + 1 ] ].
	^ middle
]
