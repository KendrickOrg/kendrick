as yet unclassified
testParserforIndexedEquation

|  model s i r indexedEquation |
model := KEIndexedModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1.
i := (KECompartment new) status: #I; numberOfIndividuals: 1.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta put:#((520 260) (1 1)).
model atParameter: #gamma put: 365/7.

indexedEquation := 'S[j]:t=-beta[1, 1]*S*I' parseAsAnEquation.
model addEquation: indexedEquation.

self assert: (indexedEquation variable symbol) equals: #S.
self assert: (indexedEquation tVariable symbol) equals: #t.
self assert: (indexedEquation idVariable) equals: #j.
self assert: (indexedEquation expression evaluateWithModel: model) equals: -520



