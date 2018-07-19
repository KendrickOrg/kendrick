Extension { #name : #BlockClosure }

{ #category : #'*Kendrick-InternalDSL-DSL' }
BlockClosure >> expression [

	^ self
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
BlockClosure >> isAVariable [

	^ true
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
BlockClosure >> isUnaryExpression [

	^ true
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
BlockClosure >> symbol [

	^ self at: 1
]
