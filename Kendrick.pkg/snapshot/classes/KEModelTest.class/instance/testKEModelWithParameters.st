
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWithParameters

| model s i r |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1-1e-6.
i := (KECompartment new) status: #I; numberOfIndividuals: 1e-6.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment:i; addCompartment:r.
model atParameter:#beta put: 520.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter:#beta) equals: 520.
self assert: (model atParameter:#gamma) equals: 365/7.! !
