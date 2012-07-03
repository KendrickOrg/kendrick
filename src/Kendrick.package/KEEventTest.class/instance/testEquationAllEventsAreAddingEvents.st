tests
testEquationAllEventsAreAddingEvents

| didt |
didt :=  'I:t=beta*S*I+gamma*I' parseAsODEEquation.
didt generateEvents do:[:each |  self assert: true equals: (each isAddingOneIndividualFrom:#I)].