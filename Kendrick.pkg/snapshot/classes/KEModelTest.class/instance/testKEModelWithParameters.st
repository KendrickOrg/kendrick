
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWithParameters

| model|
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 520.
model atParameter: #gamma put: 365/7.
self assert: 520 equals: (model atParameter:#beta).
self assert: 365/7 equals: (model atParameter:#gamma)! !
