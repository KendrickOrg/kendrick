as yet unclassified
acceptKEBinaryExpression: aModelNode

self visitNode: aModelNode leftHandSide.
stream nextPutAll: aModelNode op.
self visitNode: aModelNode rightHandSide.