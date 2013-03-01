tests
testParameterAsExpression1

|  model s i r dsdt didt drdt |
model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: 1.
model atCompartment: #I putNumberOfIndividuals: 1.
model atCompartment: #R putNumberOfIndividuals: 0.
model atParameter: #beta putExpression: 'beta[i,j]=(i-j)^2' parseAsAnEquation. 
model atParameter: #i put: (50 to: 100).
model atParameter: #j put: (50 to: 100).

dsdt := 'S:t=-beta[i, j]*S*I' parseAsAnEquation.
model addEquation: dsdt.
model eqIdVariable: #i.
model eqIdValue: 50.
model fnIdVariable: #j.
model fnIdValue: 70.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: (-400).