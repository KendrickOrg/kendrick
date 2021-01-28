Class {
	#name : #LinearWalkProportionalSelection,
	#superclass : #ProportionalSelection,
	#instVars : [
		'total'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'as yet unclassified' }
LinearWalkProportionalSelection >> at: index put: value [
total := total + value - frequencies at:index.
frequencies at: index  put: value
]

{ #category : #'as yet unclassified' }
LinearWalkProportionalSelection >> initialize: size [

super initialize: size.
total := 0
]

{ #category : #'as yet unclassified' }
LinearWalkProportionalSelection >> normalize [
	"do nothing"
]

{ #category : #'as yet unclassified' }
LinearWalkProportionalSelection >> sample [
	| accumulator cumulativeDensityPoint |
	accumulator := 0.
	cumulativeDensityPoint := total atRandom.
	frequencies doWithIndex: [ :each :i | 
		accumulator := accumulator + each.
		accumulator >= cumulativeDensityPoint
			ifTrue: [ ^ i ] ]
]
