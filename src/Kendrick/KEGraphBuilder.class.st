"
Root of all Kendrick visualization engines.

"
Class {
	#name : #KEGraphBuilder,
	#superclass : #KEEntity,
	#instVars : [
		'data'
	],
	#category : #'Kendrick-Core'
}

{ #category : #adding }
KEGraphBuilder >> addData: aDataFrame [

data add: aDataFrame 
]

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
