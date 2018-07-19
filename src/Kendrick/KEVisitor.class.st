"
A KEVisitor is a visitor that visits all nodes of the model and generate the code GPL for this model.

"
Class {
	#name : #KEVisitor,
	#superclass : #KEEntity,
	#category : 'Kendrick-Code-Generators'
}

{ #category : #'as yet unclassified' }
KEVisitor >> visitNode: model [
	self subclassResponsibility 
]
