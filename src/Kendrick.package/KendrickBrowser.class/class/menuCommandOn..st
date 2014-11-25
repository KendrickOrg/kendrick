as yet unclassified
menuCommandOn: aBuilder
 <worldMenu>

	(aBuilder item: #'Kendrick Browser')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick Browser';
			icon: RTIcon smallRoassal;
			action: [ self new open ]	
