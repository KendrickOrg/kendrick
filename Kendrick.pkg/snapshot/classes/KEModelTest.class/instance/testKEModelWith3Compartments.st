
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWith3Compartments

| model s i r |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1-1e-6.
i := (KECompartment new) status: #I; numberOfIndividuals: 1e-6.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
self assert: model numberOfCompartments equals: 3! !
