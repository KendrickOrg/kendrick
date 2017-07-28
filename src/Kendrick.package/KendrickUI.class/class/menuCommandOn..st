world menu
menuCommandOn: aBuilder
 <worldMenu>

	(aBuilder item: #'Kendrick Browser')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick UI';
			icon: KEIcon smallKendrick;
			action: [ self openWithDependancies ]	
