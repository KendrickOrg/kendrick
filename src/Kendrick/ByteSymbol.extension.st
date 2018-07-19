Extension { #name : #ByteSymbol }

{ #category : #'*Kendrick-Semantic-Model-Core' }
ByteSymbol >> isBinaryExpression [
	^ false
]

{ #category : #'*Kendrick-Semantic-Model-Core' }
ByteSymbol >> isDigit [
	^ self asInteger ~= nil
]

{ #category : #'*Kendrick-Semantic-Model-Core' }
ByteSymbol >> isSeparator [
	^ self = ' '
]
