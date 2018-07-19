"
A KECPPGenerator generates the C/C++ code for the model specified in Kendrick language.

"
Class {
	#name : #KECPPGenerator,
	#superclass : #KECodeGenerator,
	#category : 'Kendrick-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPGenerator >> initialize [
	super initialize.
	self visitor: (KECPPVisitor new)
]
