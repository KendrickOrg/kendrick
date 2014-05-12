as yet unclassified
doDFSOn: aPopulation with: aStack
	"Do a depth first search on the tree of population for finding all leaves nodes of it. A leave node is a population of compartments, when found, store all ids of its branch in PIDList"
	(((aPopulation isAPopulationOfCompartments) | (aPopulation getNbSubPopulations = 0)) and: aPopulation id = 0) ifTrue: [ ^ PIDList := #(0) ].
	aPopulation id > 0 ifTrue: [ aStack addLast: aPopulation id ].
	aPopulation nodes do: [ :each|
		each isAPopulationOfCompartments ifTrue: [
		  aStack addLast: each id.
		  PIDList addLast: aStack asArray.
		  aStack removeLast	
		 ] ifFalse: [ self doDFSOn: each with: aStack ]
		 ].
	aStack isNotEmpty ifTrue: [ aStack removeLast ] 