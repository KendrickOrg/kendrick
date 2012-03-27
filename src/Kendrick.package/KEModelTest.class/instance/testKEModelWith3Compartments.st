as yet unclassified
testKEModelWith3Compartments

| model s i r |
model := KEModel new.
s := (KECompartment new) status: #S; initialValue: 1-1e-6.
i := (KECompartment new) status: #I; initialValue: 1e-6.
r := (KECompartment new) status: #R; initialValue: 0.
model add: s; add: i; add: r.
self assert: model numberOfCompartments equals: 3