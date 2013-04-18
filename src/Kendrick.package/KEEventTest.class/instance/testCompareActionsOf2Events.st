tests
testCompareActionsOf2Events

|  e1 e2 e3 e4  |
e1 := KEEvent new.
e2 := KEEvent new.
e3 := KEEvent new.
e4 := KEEvent new.
e1 actions at: ((KEVariable new) symbol: #S) put: 1; at: ((KEVariable new) symbol: #I) put: -1.
e2 actions at: ((KEVariable new) symbol: #S) put: 1; at: ((KEVariable new) symbol: #I) put: -1.
e3 actions at: ((KEIndexedVariable new) symbol: #S;idExpression1: 1) put: 1; at: ((KEIndexedVariable new) symbol: #I;idExpression1: 2) put: -1.
e4 actions at: ((KEIndexedVariable new) symbol: #S;idExpression1: 1) put: 1; at: ((KEIndexedVariable new) symbol: #I;idExpression1: 2) put: -1.
self assert: true equals: (e1 compareWithActionsOf: e2).
self assert: true equals: (e3 compareWithActionsOf: e4).
