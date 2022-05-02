Extension { #name : #ByteSymbol }

{ #category : #'*Kendrick-Core' }
ByteSymbol >> isBinaryExpression [
	^ false
]

{ #category : #'*Kendrick-Core' }
ByteSymbol >> isDigit [
	^ self asInteger ~= nil
]

{ #category : #'*Kendrick-Core' }
ByteSymbol >> isSeparator [
	^ self = ' '
]
