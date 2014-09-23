as yet unclassified
atEquation: symbol
	"get an equation from equation list according to its variable"
	equations do: [ :each|
		(each variable symbol = symbol) ifTrue: [ ^ each ]
		 ].
	^ nil