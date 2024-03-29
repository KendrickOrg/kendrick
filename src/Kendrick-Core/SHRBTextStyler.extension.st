Extension { #name : #SHRBTextStyler }

{ #category : #'*Kendrick-Core' }
SHRBTextStyler >> visitMessageNode: aMessageNode [
	| style link |
	style := #keyword.
	(Symbol findInternedSelector: aMessageNode selector asString)
		ifNil: [ 
			style := (Symbol selectorThatStartsCaseSensitive: aMessageNode selector asString skipping: nil)
				ifNil: [ #keyword ]
				ifNotNil: [ #keyword ] ].
	link := TextMethodLink selector: aMessageNode selector.
	self styleOpenParenthese: aMessageNode.
	aMessageNode selectorParts
		with: aMessageNode keywordsPositions
		do: [ :keyword :position | 
			self
				addStyle: style
				attribute: link
				from: position
				to: position + keyword size - 1 ].
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	aMessageNode arguments do: [ :each | self visitNode: each ].
	self styleCloseParenthese: aMessageNode
]
