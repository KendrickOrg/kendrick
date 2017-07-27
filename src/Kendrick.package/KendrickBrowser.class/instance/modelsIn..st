as yet unclassified
modelsIn: arg1
	| tmp2 |
	tmp2 := arg1 list.
	tmp2
		display: [ :arg2 | arg2 ];
		format: [ :arg3 | arg3 name ]