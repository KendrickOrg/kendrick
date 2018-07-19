"
For visualization of a Kendrick model
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #KEGraphBuilder,
	#superclass : #KEEntity,
	#instVars : [
		'data'
	],
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #'as yet unclassified' }
KEGraphBuilder >> build [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
KEGraphBuilder >> data [
	^ data
]

{ #category : #'as yet unclassified' }
KEGraphBuilder >> data: aCollection [
	data := aCollection
]

{ #category : #'as yet unclassified' }
KEGraphBuilder >> initialize [
	data := OrderedCollection new
]

{ #category : #'as yet unclassified' }
KEGraphBuilder >> open [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
KEGraphBuilder >> view [
	self subclassResponsibility
]
