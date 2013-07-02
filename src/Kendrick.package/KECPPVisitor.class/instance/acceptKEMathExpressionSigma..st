as yet unclassified
acceptKEMathExpressionSigma: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	strInitializeKEMath := WriteStream on: (String new: 60).
	aNode idVariable = #j ifFalse: [ aNode idVariable = #j ].
	strInitializeKEMath nextPutAll: String tab, String tab, 'double sumSigma = 0.0;';cr.
	strInitializeKEMath nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	strInitializeKEMath nextPutAll: String tab, String tab, String tab, 'sumSigma += '.
	strInitializeKEMath nextPutAll: (self visitNode: aNode exprInFunction), ';';cr.
	aStream nextPutAll: 'sumSigma'.
	^ aStream contents
	