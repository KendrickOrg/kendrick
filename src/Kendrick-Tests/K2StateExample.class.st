Class {
	#name : #K2StateExample,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM2'
}

{ #category : #tests }
K2StateExample >> testCreatingMoreComplexStateNameExample [
	
	<gtExample>
	| state |
	state := K2State new
		     stateName: { 
				     (#aState -> #S).
				     (#species -> #human) };
		     cardinality: 100;
		     yourself.
	self assert: state stateName equals: { 
			(#aState -> #S).
			(#species -> #human) }.
	self assert: state cardinality equals: 100.
	^state
]

{ #category : #tests }
K2StateExample >> testCreatingStateExample [
	<gtExample>
	| state |
	state := K2State new
		stateName: {(#aState -> #S)};
		cardinality: 100; 
		yourself.
	self assert: state stateName equals: {(#aState -> #S)}.
	self assert: state cardinality equals: 100.
	^ state
]

{ #category : #tests }
K2StateExample >> testInitializeStateCardinalityExample [

	<gtExample>
	| san |
	san := K2SAN new.
	san attributes: { 
			(#status -> #( S I R )).
			(#region -> #( A B C D )) }.
	san stateCardinality: 10.

	self assert: (san stateCardinality ) equals: 10.
	^san
]
