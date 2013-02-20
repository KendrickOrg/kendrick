tests
testEquationCreateAnEventThatAddOneIndividual

| dsdt |
dsdt := 'S:t=beta*S*I' parseAsAnEquation.
self assert: true equals:(dsdt generateEvents any isAddingOneIndividualFrom: #S)