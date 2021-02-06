Class {
	#name : #StochasticAcceptanceProportionalSelection,
	#superclass : #ProportionalSelection,
	#instVars : [
		'maxValue'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #accessing }
StochasticAcceptanceProportionalSelection >> at: index put: value [
	| lastX |
	lastX := frequencies at: index.
	maxValue := maxValue max: value.
	lastX == maxValue & (value < lastX)
		ifTrue: [ maxValue := frequencies max asFloat ].
	frequencies at: index put: value
]

{ #category : #initialization }
StochasticAcceptanceProportionalSelection >> initialize: size [  
	
	super initialize: size.
	maxValue := 0
]

{ #category : #'as yet unclassified' }
StochasticAcceptanceProportionalSelection >> normalize [ 
	"nothing"
]

{ #category : #accessing }
StochasticAcceptanceProportionalSelection >> sample [
	| x i j|
	
	x := Random new next.
	i := (frequencies size * x) asInteger.
	j := ((frequencies at: i)/maxValue).
	[ i > 0 ]
		whileTrue: [ (x  < (j + 1))
				ifTrue: [ ^ i ] ]
]
