
!KECompartmentTest methodsFor: 'as yet unclassified'!
testHowtoCreateACompartment

| compartment |
compartment := (KECompartment new) status: #S; initialValue: 1-1e-6.
self assert: compartment status equals: #S.
self assert: compartment initialValue equals:1-1e-6! !
