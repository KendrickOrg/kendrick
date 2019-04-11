"
A KEExamples is a class that contains some examples of epidemiological modelling

"
Class {
	#name : #KEExamples,
	#superclass : #RTAbstractExample,
	#classInstVars : [
		'ModelExample'
	],
	#category : 'Kendrick-Examples'
}

{ #category : #'as yet unclassified' }
KEExamples class >> models [
   |models deterministic methods|   
	models := OrderedCollection new.
	deterministic := KEDeterministicExamples new.
	methods := (KEDeterministicExamples selectors 
			select: [ :symbol | (symbol beginsWith: 'model') ]).
	methods do:[ :m | models add:(deterministic perform: m) ].
	
	^ models
]
