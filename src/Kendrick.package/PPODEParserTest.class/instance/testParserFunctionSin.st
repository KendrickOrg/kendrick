tests
testParserFunctionSin

|  model dsdt didt drdt |
model := KEModel new.
model atCompartment: #S putNumberOfIndividuals: 99999.
model atCompartment: #I putNumberOfIndividuals: 1.
model atCompartment: #R putNumberOfIndividuals: 0.
model atParameter: #beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model timeValue: 10.

dsdt := 'S:t=beta*S*I + sin(2*t)' parseAsAnEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: (model atParameter: #beta) * (model numberOfIndividualsAtCompartment: #S) + (2 * model timeValue) sin