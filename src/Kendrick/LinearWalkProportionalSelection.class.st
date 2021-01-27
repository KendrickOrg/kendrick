Class {
	#name : #LinearWalkProportionalSelection,
	#superclass : #ProportionalSelection,
	#instVars : [
		'total'
	],
	#category : #'Kendrick-Core'
}

{ #category : #accessing }
LinearWalkProportionalSelection >> at: index put: value [ [
total := total + value - frequencies at:index.
frequencies at: index  put: value
]
]

{ #category : #initialization }
LinearWalkProportionalSelection >> initialize: size [ [

super initialize: size.
total := 0
]

]

{ #category : #converting }
LinearWalkProportionalSelection >> normalize [ [
	"do nothing"
]
]

{ #category : #examples }
LinearWalkProportionalSelection >> sample [ [
	| accumulator cumulativeDensityPoint |
	accumulator := 0.
	cumulativeDensityPoint := total atRandom.
	frequencies doWithIndex: [ :each :i | 
		accumulator := accumulator + each.
		accumulator >= cumulativeDensityPoint
			ifTrue: [ ^ i ] ]
]
]
