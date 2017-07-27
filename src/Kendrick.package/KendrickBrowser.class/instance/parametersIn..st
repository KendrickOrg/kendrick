as yet unclassified
parametersIn: arg1
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		display: [ :arg2 | arg2 parameters ];
		column: 'Name' evaluated: [ :arg3 | arg3 asString ] width: 150;
		column: 'Value' evaluated: [ :arg4 | arg4 asString ]