as yet unclassified
menuCommandOn: aBuilder
	<worldMenu>
	((aBuilder item: #Kendrick) icon: KEIcon smallKendrick)
	withSeparatorAfter;
	with: [
		(aBuilder item: #'Kendrick Examples GT')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick examples GT';
			icon: KEIcon smallKendrick;
			action: [ self new open ] ]