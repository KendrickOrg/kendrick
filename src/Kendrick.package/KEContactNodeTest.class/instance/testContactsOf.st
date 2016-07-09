as yet unclassified
testContactsOf
	|node model network|
	model := KEModel new population: (KEPopulation size: 100).
	network := KEContactNetwork nodes: 100 topology: { #random. #p->1 }.
	model addAttribute: #node value: network contacts.
	model addAttribute: #network value: {network}.
	1 to: 100 do: [ :i| model atCompartment: { #node->(i asString asSymbol). #network->network } put: 1 ].
	model currentCompartment: (Dictionary newFrom: {#node->#'1'. #network->network}).
	node := network atNode: #'1'.
	self assert: (node contactsOf: {model}) equals: 99
	