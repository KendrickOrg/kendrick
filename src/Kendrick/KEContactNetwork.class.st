"
KEContactNetwork represents a contact patterns between all subpopulations/individuals of an epidemiological model
"
Class {
	#name : #KEContactNetwork,
	#superclass : #KEGraph,
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #adding }
KEContactNetwork >> addNode: aNodeLabel [
	nodes add: (KEContactNode new label: aNodeLabel)
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> allContacts [
	^ self nodes collect: [ :e| e label ]
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> contactsOf: arguments [
	|model node attributes args|
	model := arguments first.
	attributes := Dictionary newFrom: (arguments copyFrom: 2 to: arguments size).
	node := attributes at: #node.
	attributes removeKey: #node.
	args := OrderedCollection new.
	args add: model.
	args addAll: attributes associations.
	^ (self atNode: node) contactsOf: args
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> createNodeOf: ind [
	"This function is just called in the case of network of individuals"
	(ind id > self nodes size) ifTrue: [ 
		self addNode: { #status->(ind currentStatus at: #status). #id->(ind id) }	].
	topology appendNode: ({#status->(ind currentStatus at: #status). #id->(ind id) })->(ind id)
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> edgesFrom: arguments [
	"model. status"
	|attributes group model sum|
	arguments size <= 1 ifTrue: [ ^0. ].
	model := arguments first.
	attributes := Dictionary newFrom: { #status -> (arguments at: 2)}.
	sum := 0.
	group := model atCompartment: attributes.
	1 to: (group size) do:
	[  :i|
		(group at: i) = 1 ifTrue: [ 
				sum := sum + (((self 
										nodes at: i) adjacentNodes) size).
			 ]
	].
	^sum.
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> releaseNodeOf: ind [
	"This function is just called in the case of network of individuals"
	|adjacentNodeLabels currentNode|
	topology activeNodes remove: ind id.
	currentNode := (self nodes at: ind id).
	adjacentNodeLabels := currentNode adjacentNodes keys.
	adjacentNodeLabels do: [ :k| 
		(self nodes at: ((Dictionary newFrom: k) at: #id)) adjacentNodes removeKey: currentNode label.
		currentNode adjacentNodes removeKey: k
		].
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> updateNodeOf: ind [
	"This function is just called in the case of network of individuals"
	|currentNode newLabel|
	currentNode := (self nodes at: ind id).
	newLabel :=  { #status->(ind nextStatus at: #status). #id->(ind id) }.
	currentNode adjacentNodes keysAndValuesDo: [ :k :v| 
		|idx|
		idx := (Dictionary newFrom: k) at: #id.
		(self nodes at: idx) adjacentNodes removeKey: currentNode label ifAbsent: [ ].
		(self nodes at: idx) addAdjacentNode: (newLabel->v)
		].
	currentNode label: newLabel
	
]

{ #category : #accessing }
KEContactNetwork >> value: aModel [
	^ self
]
