as yet unclassified
addParameter: aSymbol inScopes: associations values: inputs
	"add new parameter for several scopes in one time"
	associations isArray 
	ifFalse: [ 
		associations value size = inputs size ifFalse: [ ^ self error: 'The size of scopes and inputs must be equal' ].
		1 to: inputs size do: [ :i|
			(associations value at: i) = #others 
			ifTrue: [ 
				|tmp key |
				tmp := associations select: [ :e| e ~= #others ].
				key := tmp first key.
				tmp := tmp collect: [ :e| e value ].
				((self population attributes at: key) select: [ :e| (tmp include: e) not ]) do: [ :v| 
					(parameters at: (Dictionary newFrom: {key->v}) ifAbsentPut: (Dictionary new)) at: aSymbol put: (inputs at: i).
					 ]
			]
			ifFalse: [ 
				(parameters at: (Dictionary newFrom: {associations key->(associations value at: i)}) ifAbsentPut: (Dictionary new)) at: aSymbol put: (inputs at: i)
			] 
		] ]
	ifTrue: [  
		1 to: inputs size do: [ :i|
			(parameters at: (Dictionary newFrom: {associations at: i}) ifAbsentPut: (Dictionary new)) at: aSymbol put: (inputs at: i)
		]
	]
	