utilities
crossProduct: aCollection

"Cartesian product of a collection"
"Code from: https://stackoverflow.com/questions/9867897/generating-all-combinations-from-collections-in-smalltalk"
"Maybe the iterative version should be used instead of the recursive one."

	| expand |
	expand := [ :prefix :list | 
	list isEmpty
		ifTrue: [ Array with: prefix ]
		ifFalse: [ | tail |
			tail := list allButFirst: 1.
			list first inject: #() into: [ :all :each | all , (expand value: (prefix copyWith: each) value: tail) ] ] ].
	^ expand value: #() value: aCollection