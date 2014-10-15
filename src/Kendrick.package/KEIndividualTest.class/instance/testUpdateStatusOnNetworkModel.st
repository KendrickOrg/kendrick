tests
testUpdateStatusOnNetworkModel
	|model population network before after node|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	network := KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	model currentSubPopulation: (model population).
	(model population individuals at: 80) nextStatus: #I.
	node := model population graph nodes at: ((model population graph nodes at: 80) adjacentNodes first).
	before := node at: #I.
	self assert: before equals: 0.
	(model population individuals at: 80) updateStatus: model.
	after := node at: #I.
	self assert: after equals: 1. 
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population at: #I) currentNbIndividuals equals: 2.
	self assert: (model population individuals at: 80) currentStatus equals: #I
	