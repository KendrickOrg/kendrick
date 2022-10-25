"
A BisectingSearchProportionalSelectionTest is a test class for testing the behavior of BisectingSearchProportionalSelection
"
Class {
	#name : #KEBisectingSearchProportionalSelectionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #tests }
KEBisectingSearchProportionalSelectionTest >> testSampleReturnOneValueLessOrEqualsThanSize [

	| values selection |
	values := #( 10 2 3 4 5 6 7 8 9 10 ).
	selection := KEBisectingSearchProportionalSelection from: values.
	selection normalize.
	self assert: selection sample <= values size
]
