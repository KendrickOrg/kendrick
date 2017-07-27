as yet unclassified
menuCommandOn: arg1
	| tmp2 |
	tmp2 := arg1 item: #'Kendrick Browser'.
	tmp2
		order: 0.1;
		parent: #Kendrick;
		label: 'Kendrick Browser';
		icon: KEIcon smallKendrick;
		action: [ self new open ]