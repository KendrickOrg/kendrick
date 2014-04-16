tests
testParserFunctionLog

|  model s i r dsdt didt drdt |
model := KEModel new.
model atCompartment: #S putNumberOfIndividuals: 99999.
model atCompartment: #I putNumberOfIndividuals: 1.
model atCompartment: #R putNumberOfIndividuals: 0.
model atParameter: #beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model timeValue: 10.

dsdt := 'S:t=beta*log(2*t)*S*I' parseAsAnEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: ((20 log)*0.0052*99999).




