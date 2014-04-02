tests
testParserIndexedVariableInEquation2

|  model    dsdt   |
model := KEModel new.
model atCompartment: #S putNumberOfIndividuals: 1.
model atCompartment: #I putNumberOfIndividuals: 1.
model atCompartment: #R putNumberOfIndividuals: 0.
model atParameter: #beta put:#((520 260) (1 1)).
model atParameter: #gamma put: 365/7.

dsdt := 'S[j]:t=-beta[1, 1]*S*I' parseAsAnEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt idVariable) equals: #j.
self assert: (dsdt expression evaluateWithModel: model) equals: (-520).



