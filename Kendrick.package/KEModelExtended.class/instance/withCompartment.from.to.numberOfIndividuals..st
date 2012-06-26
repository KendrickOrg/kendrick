as yet unclassified
withCompartment: aStatus from: index1 to: index2 numberOfIndividuals: nbIndividuals
"Use this method for modifying the numberOfIndividuals. THis method is usually used with the construction method for the case of large number of host"
| arrayOfIndividuals |
compartments do: [:each|
	each status = aStatus ifTrue:[
		arrayOfIndividuals := each numberOfIndividuals.
		arrayOfIndividuals ifNil: [
			each numberOfIndividuals: (Array new: (each numberOfSpecies)).
			index1 to: index2 do: [:index | (each numberOfIndividuals) at: index put: nbIndividuals.]			
			] 
		ifNotNil: [
			index1 to: index2 do: [:index | (each numberOfIndividuals) at: index put: nbIndividuals.]			
			]
		]
	].
