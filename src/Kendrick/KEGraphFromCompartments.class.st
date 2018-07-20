"
Build a graph of compartments from a KEModel
"
Class {
	#name : #KEGraphFromCompartments,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'model'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'instance creation' }
KEGraphFromCompartments class >> on: aKEModel [
	^ self new model: aKEModel
]

{ #category : #configuration }
KEGraphFromCompartments >> edgeClass [
	^ MalWeightedEdge
]

{ #category : #accessing }
KEGraphFromCompartments >> model: aKEModel [
	model := aKEModel
]

{ #category : #running }
KEGraphFromCompartments >> run [
	self nodes: model initCompartments keys.
			self
				edges: (model transitions collect: [ :t | 
					{(t from) .
					(t to) . t probability}]) 
				from: #first
				to: #second
				weight: #third
]
