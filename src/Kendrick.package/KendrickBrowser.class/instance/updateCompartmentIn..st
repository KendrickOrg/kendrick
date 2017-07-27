as yet unclassified
updateCompartmentIn: arg1
	| tmp2 |
	tmp2 := arg1 magritte.
	tmp2
		description: [ :arg2 | arg2 magritteDescription ];
		onAnswer: [ :arg3 :arg4 :arg5 | 
			arg3 numberOfIndividuals: arg5.
			browser update ]