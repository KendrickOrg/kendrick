Extension { #name : #String }

{ #category : #'*Kendrick-ExternalDSL' }
String >> parseAsAnEquation [

^PPODEParser parse: self
]

{ #category : #'*Kendrick-ExternalDSL' }
String >> parseAsAnExpression [

^PPODEParser parse: self
]
