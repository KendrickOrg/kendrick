accessing
model: aString
	|concern|

	concern := KendrickModel withId: aString.
	(concerns includes: concern) ifFalse: [  "no duplicates"
		concern extends do: [ :ext | 
			self concern: ext 
		]. "-- is this integrated in the backend ?" 
		concerns add: concern.
		self model integrate: concern.
	]