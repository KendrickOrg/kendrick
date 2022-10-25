Class {
	#name : #KEStochasticAcceptanceProportionalSelection,
	#superclass : #KEProportionalSelection,
	#instVars : [
		'maxValue'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #accessing }
KEStochasticAcceptanceProportionalSelection >> at: index put: value [
	| lastX |
	lastX := frequencies at: index.
	maxValue := maxValue max: value.
	lastX == maxValue & (value < lastX)
		ifTrue: [ maxValue := frequencies max asFloat ].
	frequencies at: index put: value
]

{ #category : #initialization }
KEStochasticAcceptanceProportionalSelection >> initialize: size [  
	
	super initialize: size.
	maxValue := 0
]

{ #category : #'as yet unclassified' }
KEStochasticAcceptanceProportionalSelection >> normalize [ 
	"nothing"
]

{ #category : #accessing }
KEStochasticAcceptanceProportionalSelection >> sample [
	| rng n |
	rng := Random new.
	n := frequencies size.
	[ true ]
		whileTrue: [ | i |
			i := n atRandom.
			rng next < ((frequencies at: i) / maxValue)
				ifTrue: [ ^ i ] ]
]
