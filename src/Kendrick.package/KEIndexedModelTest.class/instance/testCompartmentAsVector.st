tests
testCompartmentAsVector
"This test is for constructing a compartment as a vector with small number of host"
|model compartment|

model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: #(10000 9000 12000).
compartment := model atCompartment: #S.
self assert: (compartment numberOfSpecies) equals: 3.
self assert: ((compartment numberOfIndividuals) at: 2) equals: 9000.