
!KEModelTest methodsFor: 'as yet unclassified'!
testSIRModel

| model s i r dsdt m1 m2 vars vari beta expbin1 expbin2 u |
model := KEModel new.
s := (KECompartment new) status: #S; initialValue: 1-1e-6.
i := (KECompartment new) status: #I; initialValue: 1e-6.
r := (KECompartment new) status: #R; initialValue: 0.
model add: s; add:i; add:r.
model atParameter:#beta put: 520.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter:#beta) equals: 520.
self assert: (model atParameter:#gamma) equals: 365/7.

model addEquation:(self buildDSDt).
model addEquation:(self buildDIDt).
model addEquation:(self buildDRDt).

self assert: (model equations size) equals:3.
! !
