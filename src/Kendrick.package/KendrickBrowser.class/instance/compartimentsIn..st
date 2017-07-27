as yet unclassified
compartimentsIn: arg1
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		display: [ :arg2 | arg2 compartments ];
		column: 'Name' evaluated: [ :arg3 | arg3 asString ] width: 120;
		column: 'Number Of Individuals'
			evaluated: [ :arg4 | arg4 asString ];
		selectionAct: [ :arg5 | arg5 selection inspect ]
			on: $v
			entitled: 'View'