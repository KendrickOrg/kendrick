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
		ifTrue: [ maxValue := value ]
		ifFalse: [ 
			(lastX == maxValue & value < lastX) do: [ maxValue := (frequencies at: index) max asFloat ]
			].
			frequencies at: index put: value.
			 
]

{ #category : #initialization }
StochasticAcceptanceProportionalSelection >> initialize: size [  
	
	super initialize: size.
	maxValue := 0
]
