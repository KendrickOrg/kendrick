Class {
	#name : #K2DTMC,
	#superclass : #K2Automaton,
	#instVars : [
		'matrix'
	],
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #'instance creation' }
K2DTMC class >> newFromArray: anArrayOfRows initialState: aNumber [

	^ self new
		  matrix: anArrayOfRows;
		  initialState: aNumber
]

{ #category : #creation }
K2DTMC >> matrix: anArrayOfRows [

	matrix := PMMatrix rows: anArrayOfRows
]

{ #category : #creation }
K2DTMC >> steadyStates [

	"Use the Vector-Matrix Multiplication method to compute an approximation of the exact solution"

	| accumulatedVector newVector |
	accumulatedVector := PMVector zeros: matrix numberOfRows.
	accumulatedVector at: 1 put: 1.0.
	[ 
	newVector := accumulatedVector * matrix.
	newVector closeTo: accumulatedVector ] whileFalse: [ 
		accumulatedVector := newVector ].
	^ newVector
]
