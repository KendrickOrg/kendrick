Class {
	#name : #KELinearWalkProportionalSelection,
	#superclass : #KEProportionalSelection,
	#instVars : [
		'total'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'as yet unclassified' }
KELinearWalkProportionalSelection >> at: index put: value [
total := total + value - frequencies at:index.
frequencies at: index  put: value
]

{ #category : #'as yet unclassified' }
KELinearWalkProportionalSelection >> initialize: size [

super initialize: size.
total := 0
]

{ #category : #'as yet unclassified' }
KELinearWalkProportionalSelection >> normalize [
	"do nothing"
]

{ #category : #'as yet unclassified' }
KELinearWalkProportionalSelection >> sample [
	| accumulator cumulativeDensityPoint |
	accumulator := 0.
	cumulativeDensityPoint :=  (Random new next)*total.
	frequencies
		doWithIndex: [ :each :i | 
			accumulator := accumulator + each.
			accumulator >= cumulativeDensityPoint
				ifTrue: [ ^ i ] ]
]
