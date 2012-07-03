tests
testEquationCreateAnEventThatAddOneIndividual

| dsdt |
dsdt := 'S:t=beta*S*I' parseAsODEEquation.
self assert: true equals:(dsdt generateEvents any isAddingOneIndividualFrom: #S)