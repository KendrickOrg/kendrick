as yet unclassified
updateParametersIn: arg1
	| tmp2 |
	tmp2 := arg1 magritte.
	tmp2
		description: [ :arg2 | arg2 magritteDescription ];
		onAnswer: [ :arg3 :arg4 :arg5 | browser update ]