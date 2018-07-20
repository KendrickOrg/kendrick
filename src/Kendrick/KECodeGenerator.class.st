"
A KECodeGenerator is responsible for generating GPL code for a model specified in Kendrick language.

Instance Variables
	visitor:		<KEVisitor>

visitor
	- The visitor that will visit the model tree and generate the code GPL for the model

"
Class {
	#name : #KECodeGenerator,
	#superclass : #KEEntity,
	#instVars : [
		'visitor'
	],
	#category : #'Kendrick-Obsolete-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECodeGenerator class >> new: aGPL [
	|generator|
	generator := KECodeGenerator new.
	aGPL = #CPP ifTrue: [ generator visitor: (KECPPVisitor new) ].
	
	^ generator
]

{ #category : #'as yet unclassified' }
KECodeGenerator >> model: anInputModel algorithm: modellingAlgorithmName file: savingFileName [
	visitor visitNode: anInputModel.
	visitor generate: modellingAlgorithmName save: savingFileName
]

{ #category : #'as yet unclassified' }
KECodeGenerator >> visitor [
	^ visitor
]

{ #category : #'as yet unclassified' }
KECodeGenerator >> visitor: aVisitor [
	visitor := aVisitor
]
