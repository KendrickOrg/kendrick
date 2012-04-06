
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWith1Compartment

| model |
model := KEModel new.
model atCompartment: #S putNumberOfIndividuals: 1-1e6.
self assert: 1 equals: model numberOfCompartments! !
