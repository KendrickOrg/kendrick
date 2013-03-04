as yet unclassified
updateNbIndividualsForCompartments

compartments do:[:eachComp|
			|status|
			status := eachComp status.	     	
			"eachComp numberOfIndividuals: (listOfIndividuals select: [:eachIndi| status = (eachIndi currentStatus)]) size."
			eachComp numberOfIndividuals: (self selectIndividualsIn: listOfIndividuals have: status) size.
			].	