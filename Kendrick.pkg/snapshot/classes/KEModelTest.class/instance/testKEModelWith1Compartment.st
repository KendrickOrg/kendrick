
!KEModelTest methodsFor: 'as yet unclassified'!
testKEModelWith1Compartment

| model compartment |
model := KEModel new.
compartment := (KECompartment new) status: #S; initialValue: 1-1e-6.
model add: compartment.
self assert: model numberOfCompartments equals:1! !
