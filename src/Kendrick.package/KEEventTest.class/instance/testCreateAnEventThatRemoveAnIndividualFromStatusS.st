tests
testCreateAnEventThatRemoveAnIndividualFromStatusS

|e|
e := KEEvent new.
e removeOneIndividualFrom: ((KEVariable new) symbol: #S).
self assert: (e isRemovingOneIndividualFrom: #S) equals: true.
