"
KERandomNetwork represents a random graph created by using the Erdos-Renyi (ER) model (http://en.wikipedia.org/wiki/Erdős–Rényi_model)

"
Class {
	#name : #KEERRandomNetworkTopology,
	#superclass : #KERandomNetworkTopology,
	#instVars : [
		'p'
	],
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEERRandomNetworkTopology >> appendNode: anAssociation [
	|label graph rand|
	label := anAssociation key.
	graph := anAssociation value.
	rand := Random new.
	activeNodes do: [ :node| 
		(p > (rand next)) ifTrue: [ 
			graph edgesFrom: label toAll: (Array with: node) ]
		].
	activeNodes add: label
]

{ #category : #'instance creation' }
KEERRandomNetworkTopology >> applyOn: graph [
	graph nodes do: [ :node| self appendNode: (node label)->graph]
	
]

{ #category : #accessing }
KEERRandomNetworkTopology >> p: aValueFrom0To1 [
	"That is the probability of connection fixed in the ER model"
	p := aValueFrom0To1 
]
