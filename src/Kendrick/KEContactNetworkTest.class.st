Class {
	#name : #KEContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEContactNetworkTest >> testContactsOf [
	|model network|
	model := KEModel new population: (KEPopulation size: 100).
	network := KEContactNetwork nodes: 100 topology: { #random. #p->1 }.
	model addAttribute: #node value: network allContacts.
	model addAttribute: #network value: {network}.
	1 to: 100 do: [ :i| model atCompartment: { #node->(i asString asSymbol). #network->network } put: 1 ].
	model currentCompartment: (Dictionary newFrom: {#node->#'1'. #network->network}).
	self assert: (network contactsOf: {model. #node->#'1'}) equals: 99
	
]

{ #category : #tests }
KEContactNetworkTest >> testEdgesFrom [
	"self new testEdgesFrom"
	|model sirConcern spatialConcern network|
	model := KEModel new population: (KEPopulation size: 10).

	sirConcern := KEModelPart new.
	sirConcern addAttribute: #status value: #(S I R).
	

	spatialConcern := KEModelPart new.
	network := KEContactNetwork nodes: 10 topology: { #random. #p->1 }.
	spatialConcern addParameter: #network value: network.
	spatialConcern addAttribute: #node value: network allContacts.


	model integrate: sirConcern.
	model integrate: spatialConcern.

	1 to: 7 do: [:i| model atCompartment: {#status->#S. #node->i asString asSymbol} put: 1].
	model atCompartment: { #status->#I. #node->#'10' } put: 1.
	model atCompartment: { #status->#I. #node->#'9' } put: 1.
	model atCompartment: { #status->#R. #node->#'8' } put: 1.
	
	self assert: (network edgesFrom: {model. #I}) equals: 18.
	self assert: (network edgesFrom: {model. #R}) equals: 9.
	self assert: (network edgesFrom: {model. #S}) equals: 63.
	
	


]

{ #category : #tests }
KEContactNetworkTest >> testLoadNodesFromFile [
	"self new testLoadNodesFromFile"
	|network|
	network := KEContactNetwork new.
	network loadNodes: 10 fromFile: 'network.dat'.
]
