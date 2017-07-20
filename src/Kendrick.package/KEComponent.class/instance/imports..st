generated
imports: aMatrix
"constructing transitions using an adjacency matrix"
|att dom|
att := self attributes associations first key.
dom := self attributes associations first value.
dom size ~= aMatrix size ifTrue: [ ^ self error: 'Size of input is not compatible' ].
1 to: aMatrix size do: [ :row| 
	1 to: (aMatrix at: row) size do: [ :col|
		(((aMatrix at: row) at: col) ~= 0) ifTrue: [ 
			self addTransitionFrom: { att->(dom at: row) } to: { att->(dom at: col) } probability: ((aMatrix at: row) at: col) asString]
	]
]
	