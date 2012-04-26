as yet unclassified
testCompartmentSymbol

| model equations left right |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1e5-1.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 0.0052.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter:#beta) equals: 0.0052.
self assert: (model atParameter:#gamma) equals: 365/7.

model addEquation: (PPODEParser parse:'I:t=beta*S*I-gamma*I').
equations := model getEquationsList.
equations do:[:each|
	self assert: (each variable symbol) equals: #I.
	self assert: (each expression op) equals: #-.
	left := (each expression) leftHandSide evaluateWithModel: model.
	right := (each expression) rightHandSide evaluateWithModel: model.
	Transcript show: ((each expression) evaluateWithModel: model); cr.
	].
model atCompartment: #S modifyNumberOfIndividuals: 1000.
self assert: (model numberOfIndividualsAtCompartment: #S) equals: 1000.




