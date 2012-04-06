as yet unclassified
testPrintKEUnaryExpression

|beta minusBeta|

beta := KEVariable symbol:#beta.
minusBeta := KEUnaryExpression op:#-.
minusBeta expression: beta.

self assert: '-beta' equals: minusBeta asString.