
!KEExpressionTest methodsFor: 'as yet unclassified'!
testCompare2VariablesWithSameName

| a b |
a := KEVariable symbol: #S.
b := KEVariable symbol: #S.

self assert:true equals: (a = b)
	! !
