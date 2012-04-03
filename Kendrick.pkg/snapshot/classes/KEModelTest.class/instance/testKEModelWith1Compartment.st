
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWith1Compartment

| model compartment |
model := KEModel new.
model atCompartment: #S putNumberOfIndividuals: 1-1e6.
self assert: model numberOfCompartments equals:1! !
