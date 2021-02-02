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
(value > maxValue)
	ifTrue: [ maxValue := value ].
	
((lastX == maxValue) & (value < lastX))
	ifTrue: [ 
		maxValue := (frequencies max) asFloat ].
	
frequencies at: index put: value.
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

{ #category : #acccessing }
StochasticAcceptanceProportionalSelection >> sample [ 
	|freqs x i|
	
	freqs := frequencies.
	x := Random new next.
	i := ((frequencies size) * x) asInteger.
	 [ i > 0 ] whileTrue: [ 
		(x >= ((freqs at: i) quo: maxValue))
			ifTrue: [ ^i ] ]
]
