as yet unclassified
acceptKEBinaryExpression: aModelNode
| aStream |
aStream := WriteStream on: (String new: 60).
aStream nextPutAll: '('.
aStream nextPutAll: (self visitNode: aModelNode leftHandSide).
aStream nextPutAll: aModelNode op.
aStream nextPutAll: (self visitNode: aModelNode rightHandSide).
aStream nextPutAll: ')'.
^ aStream contents