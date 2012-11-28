tests
testCompartmentAsVector2

|model compartment|

model := KEIndexedModel new.
model atCompartment: #S numberOfSpecies: 10.
model withCompartment: #S from: 2 to: 10  numberOfIndividuals: 10000.
model withCompartment: #S withIndex: 1  numberOfIndividuals: 20000.

compartment := model atCompartment: #S.

self assert: (compartment numberOfSpecies) equals: 10.
self assert: ((compartment numberOfIndividuals) size) equals: 10.
self assert: ((compartment numberOfIndividuals) at: 4) equals: 10000.
self assert: ((compartment numberOfIndividuals) at: 1) equals: 20000