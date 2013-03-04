tests
testEquationHasTwoEvents

| equation |
equation := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
self assert: (equation generateEvents size) equals: 2