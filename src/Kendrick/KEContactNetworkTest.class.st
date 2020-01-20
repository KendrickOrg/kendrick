Class {
	#name : #KEContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEContactNetworkTest >> testContactsOf [
	|model network|
	model := KEModel new.
	network := KEContactNetwork nodes: 100 topology: { #random. #p->1 }.
	model addAttribute: #node value: network allContacts.
	model addAttribute: #network value: {network}.
	1 to: 100 do: [ :i| model atCompartment: { #node->(i asString asSymbol). #network->network } put: 1 ].
	model currentCompartment: (Dictionary newFrom: {#node->#'1'. #network->network}).
	self assert: (network contactsOf: {model. #node->#'1'}) equals: 99
	
]
