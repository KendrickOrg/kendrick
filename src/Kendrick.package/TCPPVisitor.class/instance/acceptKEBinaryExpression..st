as yet unclassified 
acceptKEBinaryExpression: aKEBExpNode
| aStream |
aStream := WriteStream on: (String new: 60).
aStream nextPutAll: '('.
aStream nextPutAll: (self visitNode: aKEBExpNode leftHandSide).
aStream nextPutAll: aKEBExpNode op.
aStream nextPutAll: (self visitNode: aKEBExpNode rightHandSide).
aStream nextPutAll: ')'.
^ aStream contents