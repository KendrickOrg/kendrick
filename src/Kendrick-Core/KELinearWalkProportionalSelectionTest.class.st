"
A LinearWalkProportionalSelectionTest is a test class for testing the behavior of LinearWalkProportionalSelection
"
Class {
	#name : #KELinearWalkProportionalSelectionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #tests }
KELinearWalkProportionalSelectionTest >> testSampleReturnOneValueLessOrEqualsThanSize [
	| values selection |
	values := #(10 2 3 4 5 6 7 8 9 10).
	selection := KELinearWalkProportionalSelection from: values.
selection normalize.
	self assert: selection sample <= values size
]

{ #category : #tests }
KELinearWalkProportionalSelectionTest >> testWithFloatValuesForFrequencies [
	| values selection |
	values := #(10.5 2.1 3.2 4 5 6 7 8 9 10).
	selection := KELinearWalkProportionalSelection from: values.
	selection normalize.
	self assert: selection sample <= values size
]
