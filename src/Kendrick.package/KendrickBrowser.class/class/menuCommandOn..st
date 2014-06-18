as yet unclassified
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #Kendrick)
		order: 0.1; 
		parent: #Tools;
		label: 'Kendrick Browser';
		action: [ self new open ]