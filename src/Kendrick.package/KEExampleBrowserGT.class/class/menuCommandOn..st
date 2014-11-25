as yet unclassified
menuCommandOn: aBuilder
	<worldMenu>
	((aBuilder item: #Kendrick) icon: RTIcon smallRoassal)
	withSeparatorAfter;
	with: [
		(aBuilder item: #'Kendrick Examples GT')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick examples GT';
			icon: RTIcon smallRoassal;
			action: [ self new open ] ]