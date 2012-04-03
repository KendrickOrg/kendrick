
!KEModelTest methodsFor: 'as yet unclassified'!
testSIRModel

| model s i r dsdt m1 m2 vars vari beta expbin1 expbin2 u |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 520.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter:#beta) equals: 520.
self assert: (model atParameter:#gamma) equals: 365/7.

model addEquation:(self buildDSDt).
model addEquation:(self buildDIDt).
model addEquation:(self buildDRDt).

self assert: (model numberOfEquations) equals:3.
! !
