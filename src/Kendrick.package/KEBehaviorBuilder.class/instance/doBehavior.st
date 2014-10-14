as yet unclassified
doBehavior
	"This function will get the information of ind and return the behavior that will be executed"
	|next ind|
	ind := self arguments at: #ind.
	next := ind nextStatus.
	next isSymbol 
	ifTrue: [ 
		next = #empty 
		ifTrue: [ self die ]
		ifFalse: [ self changeStatus ]
		]
	ifFalse: [ 
		self move 
		 ]
