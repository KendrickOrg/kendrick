"
A KEExamples is a class that contains some examples of epidemiological modelling

"
Class {
	#name : #KEExamples,
	#superclass : #Object,
	#classInstVars : [
		'ModelExample'
	],
	#category : #'Kendrick-Examples'
}

{ #category : #'as yet unclassified' }
KEExamples class >> models [
	|  deterministic methods |

	deterministic := KEDeterministicExamples new.
	methods := KEDeterministicExamples selectors
		select: [ :symbol | symbol beginsWith: 'model' ].
	^methods collect: [ :m | deterministic perform: m ].

]
