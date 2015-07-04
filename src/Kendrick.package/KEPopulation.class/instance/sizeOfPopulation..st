as yet unclassified
sizeOfPopulation: source
	|tmp arguments|
	source = #population ifTrue: [ ^ self compartments values sum ].
	arguments := configurations at: #sizeOfPopulation.
	arguments = #population ifTrue: [ ^ self compartments values sum ].
	tmp := source copy.
	source keysAndValuesDo: [ :k :v| 
		(arguments includes: k) ifFalse: [ tmp removeKey: k ] ].
	^ self sizeOfCompartments: tmp associations
	"self compartments keysAndValuesDo: [ :k :v|
		(k associations includesAll: tmp associations) ifTrue: [ c := c + v ]
	].
	^ c"
	
	
	
	