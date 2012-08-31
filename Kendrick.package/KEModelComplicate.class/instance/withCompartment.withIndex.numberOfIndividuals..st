as yet unclassified
withCompartment: aStatus withIndex: index numberOfIndividuals: nbIndividuals
"Use this method for modifying the numberOfIndividuals. THis method is usually used with the construction method for the case of large number of host"
| arrayOfIndividuals |

compartments do: [:each|
	each status = aStatus ifTrue:[
		arrayOfIndividuals := each numberOfIndividuals.
		arrayOfIndividuals ifNil: [
			each numberOfIndividuals: (Array new: (each numberOfSpecies)).
			(each numberOfIndividuals) at: index put: nbIndividuals.
			] 
		ifNotNil: [
			(each numberOfIndividuals) at: index put: nbIndividuals.	
			]
		]
	].
