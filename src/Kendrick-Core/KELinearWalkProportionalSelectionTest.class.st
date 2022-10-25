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

	| frequencies selection |
	frequencies := #( 10 2 3 4 5 6 7 8 9 10 ).
	selection := KELinearWalkProportionalSelection from: frequencies.
	selection normalize.
	self assert: selection sample <= frequencies size
]

{ #category : #tests }
KELinearWalkProportionalSelectionTest >> testWithFloatValuesForFrequencies [

	| frequencies selection |
	frequencies := #( 10.5 2.1 3.2 4 5 6 7 8 9 10 ).
	selection := KELinearWalkProportionalSelection from: frequencies.
	selection normalize.
	self assert: selection sample <= frequencies size
]
