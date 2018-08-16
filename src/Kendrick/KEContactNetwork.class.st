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
	attributes := Dictionary newFrom: { #status-> (arguments at: 2) }.
	sum := 0.
	group := model atCompartment: attributes.
	1 to: (group size) do: [ :i|
		(group at: i) = 1 ifTrue: [ 
				sum := sum + (((self 
										nodes at: i) adjacentNodes) size
									).
			 ].
	].
	^sum.
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> generateTransitions: aConcern [
	1 to: (self nodes size) do: [ :i|
		aConcern addTransitionFrom: { #node->i asString asSymbol } 
				to: { #node->i asString asSymbol } probability: 0.
		 ].
]

{ #category : #'as yet unclassified' }
KEContactNetwork >> loadNodes: numberOfNodes fromFile: fileName [
    "this method will load network (nodes and edges) from file"
    "Each line of file should be in format:  node   adjacentNode"
    "For example:  1   21"
    "It means the node 1 has contact with node 21"
    |file line array source target|
    1 to: numberOfNodes do:
    [ :i| self addNode: (i asString asSymbol) ].
    file := FileStream fileNamed: fileName.
    [file atEnd] whileFalse:
    [   
        line := file nextLine. "Process the line"
        array := line splitOn: Character tab.
        source := array first.
        target := array at: 2.
        (self edges) add: source -> target.
        (self atNode: source) adjacentNodes add: target.
    ].   
    file ifNotNil: [ file close ].
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
