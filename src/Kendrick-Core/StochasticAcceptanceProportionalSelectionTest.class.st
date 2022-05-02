Class {
	#name : #StochasticAcceptanceProportionalSelectionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #tests }
StochasticAcceptanceProportionalSelectionTest >> testSampleReturnOneValueLessOrEqualsThanSize [
	| values selection |
	values := #(10 2 3 4 5 6 7 8 9 10).
	selection := StochasticAcceptanceProportionalSelection from: values.
	selection normalize.
	self assert: selection sample <= values size
]
