as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: anArray
"Use this method in the case of small number of host, ex: 3, 4, 5...<10"
| compartment numberOfSpecies arrayOfIndividuals |
numberOfSpecies := anArray size.
"arrayOfIndividuals := Array new: numberOfSpecies.
1 to: (anArray size) do: [:id|
	arrayOfIndividuals at:id put: (anArray at:id).	
	]."
compartment := (KECompartment new) status: aStatus; numberOfIndividuals: anArray; numberOfSpecies: numberOfSpecies; isVector: true.
self addCompartment: compartment