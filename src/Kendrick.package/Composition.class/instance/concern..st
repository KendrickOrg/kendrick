as yet unclassified
concern: aString
	|concern|

	concern := KendrickModel withId: aString.
	(concerns includes: concern) ifFalse: [  "no duplicates"
		concern extends do: [ :ext | 
			self concern: ext 
		]. "-- is this integrated in the backend ?" 
		concerns add: concern.
		model integrate: concern.
	]