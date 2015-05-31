as yet unclassified
addParameter: aSymbol inScopes: associations values: inputs
	"add new parameter for several scopes in one time"
	associations isArray 
	ifFalse: [ 
		associations value = #all ifTrue: [ 
			|atts|
			atts := self population atAttribute: associations key.
			^ self addParameter: aSymbol 
			       inScopes: (atts collect: [ :e| (associations key)->e ]) 
			       values: ((1 to: atts size) collect: [ :e| inputs ]) ].
		associations value size = inputs size ifFalse: [ ^ self error: 'The size of scopes and inputs must be equal' ].
		1 to: inputs size do: [ :i|
			(associations value at: i) = #others 
			ifTrue: [ 
				|tmp key |
				tmp := associations value select: [ :e| e ~= #others ].
				key := associations key.
				((self population attributes at: key) select: [ :e| (tmp includes: e) not ]) do: [ :v| 
					(parameters at: (Dictionary newFrom: {key->v}) ifAbsentPut: (Dictionary new)) at: aSymbol put: (inputs at: i).
					 ]
			]
			ifFalse: [ 
				(
					parameters 
					at: (Dictionary newFrom: {associations key->(associations value at: i)}) 
					ifAbsentPut: (Dictionary new)
				) at: aSymbol put: (inputs at: i)
			] 
		] ]
	ifTrue: [  
		1 to: inputs size do: [ :i|
			(parameters at: (Dictionary newFrom: {associations at: i}) ifAbsentPut: (Dictionary new)) at: aSymbol put: (inputs at: i)
		]
	]
	