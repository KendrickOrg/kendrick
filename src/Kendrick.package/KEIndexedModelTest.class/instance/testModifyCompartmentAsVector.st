as yet unclassified
testModifyCompartmentAsVector
"This test is for modifying the number of individuals of a compartment as a vector with small number of host"
|model compartment|

model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: #(10000 9000 12000).
model withCompartment: #S atIndex: 1 numberOfIndividuals: 11000.
model withCompartment: #S from: 2 to: 3 numberOfIndividuals: 10000.

compartment := model atCompartment: #S.
self assert: (compartment numberOfSpecies) equals: 3.
self assert: ((compartment numberOfIndividuals) at: 1) equals: 11000.
self assert: ((compartment numberOfIndividuals) at: 2) equals: 10000.
self assert: ((compartment numberOfIndividuals) at: 3) equals: 10000.


