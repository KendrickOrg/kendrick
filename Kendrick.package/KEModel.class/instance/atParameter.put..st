as yet unclassified
atParameter: aParameter put:aValue

"parameters at:aParameter put: aValue"
	|p|
	aValue className = 'KEEquation' 
	ifTrue: [p:=(KEParameter new) symbol: aParameter; value: nil; expression: aValue] 
	ifFalse: [p:=(KEParameter new) symbol: aParameter; value: aValue; expression: nil].
	parameters at: aParameter put: p.