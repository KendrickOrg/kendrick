as yet unclassified
testCompare2Variables

| a b |
a := KEVariable new.
a symbol: #S.
b := KEVariable new.
b symbol: #S.

self assert:true equals: (a compareWith: b)
	