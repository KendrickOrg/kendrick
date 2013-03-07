as yet unclassified
updateNbIndividualsForCompartments

compartments do:[:eachComp|
	|status|
	status := eachComp status.	     
	1 to: (eachComp numberOfSpecies) do: [:id|
	(eachComp numberOfIndividuals) at: id put: ((self selectIndividualsIn: listOfIndividuals haveStatus: status withSpecieID: id) size)]
	].	