Class {
	#name : #KEContactNodeTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEContactNodeTest >> testContactsOf [
	|node model network|
	model := KEModel new population: (KEPopulation size: 100).
	network := KEContactNetwork nodes: 100 topology: { #random. #p->1 }.
	model addAttribute: #node value: network allContacts.
	model addAttribute: #network value: {network}.
	1 to: 100 do: [ :i| model atCompartment: { #node->(i asString asSymbol). #network->network } put: 1 ].
	model currentCompartment: (Dictionary newFrom: {#node->#'1'. #network->network}).
	node := network atNode: #'1'.
	self assert: (node contactsOf: {model}) equals: 99
	
]

{ #category : #tests }
KEContactNodeTest >> testSumAll [
	|node|
	node := KEContactNode new.
	self assert: (node sumAll: #(1 2 3)) equals: 6.
	self assert: (node sumAll: #(#(1 2) #(3 4 5))) equals: 15
]
