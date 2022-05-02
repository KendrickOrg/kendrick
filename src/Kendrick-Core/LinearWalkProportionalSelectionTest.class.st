"
A LinearWalkProportionalSelectionTest is a test class for testing the behavior of LinearWalkProportionalSelection
"
Class {
	#name : #LinearWalkProportionalSelectionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #tests }
LinearWalkProportionalSelectionTest >> testSampleReturnOneValueLessOrEqualsThanSize [
	| values selection |
	values := #(10 2 3 4 5 6 7 8 9 10).
	selection := LinearWalkProportionalSelection from: values.
selection normalize.
	self assert: selection sample <= values size
]

{ #category : #tests }
LinearWalkProportionalSelectionTest >> testWithFloatValuesForFrequencies [
	| values selection |
	values := #(10.5 2.1 3.2 4 5 6 7 8 9 10).
	selection := LinearWalkProportionalSelection from: values.
	selection normalize.
	self assert: selection sample <= values size
]
