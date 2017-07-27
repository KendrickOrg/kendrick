world menu
menuCommandOn: arg1
	| tmp2 |
	tmp2 := (arg1 item: #Kendrick) icon: KEIcon smallKendrick.
	tmp2
		withSeparatorAfter;
		with: [ | tmp4 |
			tmp4 := arg1 item: #'Kendrick Examples GT'.
			tmp4
				order: 0.1;
				parent: #Kendrick;
				label: 'Kendrick examples GT';
				icon: KEIcon smallKendrick;
				action: [ self new open ] ]