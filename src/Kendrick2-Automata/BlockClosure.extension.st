Extension { #name : #BlockClosure }

{ #category : #'*Kendrick2-Automata' }
BlockClosure >> asCTMC [
	| matrix input  |
	
	input := ((((self 
		asString copyReplaceAll: ' ' with: '') "remove spaces" 
		copyReplaceAll: Character cr asString with: '') "remove cr"
		copyReplaceAll: Character tab asString	with: '') "remove tabs"
			findTokens: '[]') reject: [ :e | e = ',' ]. "split to lines"
	input do: [ :inputLine | (input size - 1) == (inputLine count: [ :char | char == $, ]) ifFalse: [K2InputMatrixNotSquareException signal.]].
	matrix := Array2D new: (input size).
	input withIndexDo: [ :e :i | 
			(e findTokens: ',') withIndexDo: [ :probString :j | matrix at:i at: j put: (probString asNumber )]
		 ].
	
	^ K2CTMC newFromMatrix: matrix.
	
]

{ #category : #'*Kendrick2-Automata' }
BlockClosure >> asCTMCWithStates: aCollectionOfStates [
	| matrix input  |
	
	input := ((((self 
		asString copyReplaceAll: ' ' with: '') "remove spaces" 
		copyReplaceAll: Character cr asString with: '') "remove cr"
		copyReplaceAll: Character tab asString	with: '') "remove tabs"
			findTokens: '[]') reject: [ :e | e = ',' ]. "split to lines"
	matrix := Array2D new: (input size).
	input withIndexDo: [ :e :i | 
			(e findTokens: ',') withIndexDo: [ :probString :j | matrix at:i at: j put: (probString asNumber )]
		 ].
	
	^ K2CTMC newFromMatrix: matrix withStates: aCollectionOfStates .

]
