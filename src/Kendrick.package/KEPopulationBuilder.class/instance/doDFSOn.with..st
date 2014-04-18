as yet unclassified
doDFSOn: population with: aStack
	"Do a depth first search on the tree of population for finding all leaves nodes of it. A leave node is a population of compartments, when found, store all ids of its branch in PIDList"
	(population isAPopulationOfCompartments and: population id = 0) ifTrue: [ ^ PIDList := #(0) ].
	population id > 0 ifTrue: [ aStack addLast: population id ].
	population subPopulations do: [ :each|
		each isAPopulationOfCompartments ifTrue: [
		  aStack addLast: each id.
		  PIDList addLast: aStack asArray.
		  aStack removeLast	
		 ] ifFalse: [ self doDFSOn: each with: aStack ]
		 ].
	aStack isNotEmpty ifTrue: [ aStack removeLast ] 