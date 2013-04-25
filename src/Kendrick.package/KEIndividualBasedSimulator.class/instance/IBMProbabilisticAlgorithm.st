as yet unclassified
IBMProbabilisticAlgorithm
	| nbStep count listOfProbabilities rand listOfTransitions t nbEquations timeIndex k results nbCompartments nbSpecies listCompSym |
	nbStep := (0 to: tMax by: step) size.
	nbEquations := model numberOfEquations.
	nbCompartments := model numberOfCompartments.
	nbSpecies := model numberOfSpecies.
	listCompSym := model getListCompartmentSymbol.
	data := Array new: nbCompartments.
	timeIndex := Array new: nbCompartments.
	1 to: nbEquations do: [:index| 
		data at: index put: (Array new: nbStep).
		1 to: nbStep do: [:id|(data at: index) at: id put: (Array new: nbSpecies)]].
	1 to: nbEquations do: [:index| timeIndex at: index put: (Array new: nbStep)].
	
	listOfTransitions := model generateTransitionOfEvents.	
	listCompSym := model getListCompartmentSymbol.
	