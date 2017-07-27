as yet unclassified
printObjectAsAnItem: arg1
	[ ^ arg1 kendrickDescription ]
		on: MessageNotUnderstood
		do: [ ^ arg1 class name asString ]