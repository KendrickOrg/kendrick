as yet unclassified
dataAt: key
	data do: [ :ts|
		
		((ts compartment at: #country) == key) ifTrue: [ ^ts ]
		]