as yet unclassified
printObjectAsAnItem: anObject

	[^ anObject kendrickDescription] on: MessageNotUnderstood do: [ ^  anObject class name asString]