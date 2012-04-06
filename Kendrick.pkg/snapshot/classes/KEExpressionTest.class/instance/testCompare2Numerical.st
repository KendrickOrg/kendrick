
!KEExpressionTest methodsFor: 'as yet unclassified'!
testCompare2Numerical

| a b |
a := KENumerical new.
a number: 6.
b := KENumerical new.
b number: 6.

self assert:true equals: (a compareWith: b)
	! !
