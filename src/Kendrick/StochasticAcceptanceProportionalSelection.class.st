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

	| i|
	
	i := ((frequencies size) * (Random new next)) asInteger. 
	[ i > 0 ]
		whileTrue: 
				[ (Random new next  < (((frequencies at: i)/maxValue) ))
					ifTrue: [ ^ i ]
				]
]
