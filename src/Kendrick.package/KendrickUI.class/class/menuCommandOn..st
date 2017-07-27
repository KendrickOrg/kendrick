world menu
menuCommandOn: arg1
	<worldMenu>
	| tmp2 |
	tmp2 := arg1 item: #'Kendrick Browser'.
	tmp2
		order: 0.1;
		parent: #Kendrick;
		label: 'Kendrick UI';
		icon: KEIcon smallKendrick;
		action: [ self openWithDependancies ]