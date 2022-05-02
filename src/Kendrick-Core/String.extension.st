Extension { #name : #String }

{ #category : #'*Kendrick-Core' }
String >> parseAsAnEquation [

^PPODEParser parse: self
]

{ #category : #'*Kendrick-Core' }
String >> parseAsAnExpression [

^PPODEParser parse: self
]
