as yet unclassified
menuCommandOn: aBuilder


	(aBuilder item: #'Kendrick Browser')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick Browser';
			icon: KEIcon smallKendrick;
			action: [ self new open ]	
