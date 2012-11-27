tests
testParserFunctionLog

|  model s i r dsdt |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 99999.
i := (KECompartment new) status: #I; numberOfIndividuals: 1.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model timeValue: 10.

dsdt := 'S:t=beta*log(2*t)*S*I' parseAsAnEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: ((20 log)*0.0052*99999).




