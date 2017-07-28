tests
testCompare2NumericalsWithSameValue

| a b |
a := KENumerical number:6.
b := KENumerical number:6.

self assert:true equals: (a = b)
	