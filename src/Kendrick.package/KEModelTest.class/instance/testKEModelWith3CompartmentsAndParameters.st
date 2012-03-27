as yet unclassified
testKEModelWith3CompartmentsAndParameters

| model s i r |
model := KEModel new.
s := (KECompartment new) status: #S; initialValue: 1-1e-6.
i := (KECompartment new) status: #S; initialValue: 1-1e-6.
r := (KECompartment new) status: #S; initialValue: 1-1e-6.
model add: s; add:i; add:r.
model addParameter: #beta withValue: 520.
model addParameter: #gamma withValue: 365/7.

self assert: (model parameter:#beta) equals: 520.