Extension { #name : #BlockClosure }

{ #category : #'*Kendrick-Core' }
BlockClosure >> expression [

	^ self
]

{ #category : #'*Kendrick-Core' }
BlockClosure >> isAVariable [

	^ true
]

{ #category : #'*Kendrick-Core' }
BlockClosure >> isUnaryExpression [

	^ true
]

{ #category : #'*Kendrick-Core' }
BlockClosure >> symbol [

	^ self at: 1
]
