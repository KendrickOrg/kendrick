Class {
	#name : #KEStochasticAcceptanceProportionalSelectionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #tests }
KEStochasticAcceptanceProportionalSelectionTest >> testSampleReturnOneValueLessOrEqualsThanSize [

	| frequencies selection |
	frequencies := #( 10 2 3 4 5 6 7 8 9 10 ).
	selection := KEStochasticAcceptanceProportionalSelection from: frequencies.
	selection normalize.
	self assert: selection sample <= frequencies size
]
