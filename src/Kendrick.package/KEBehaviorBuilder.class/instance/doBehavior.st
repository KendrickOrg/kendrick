as yet unclassified
doBehavior
	"This function will get the information of ind and return the behavior that will be executed"
	|next ind|
	ind := self arguments at: #ind.
	next := ind nextStatus.
	next isArray 
	ifTrue: [ self move ]
	ifFalse: [ 
		next = #empty 
		ifTrue: [ self die ]
		ifFalse: [ self changeStatus ]
		 ].
