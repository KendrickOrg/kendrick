tests
testEquationHasOneEvent

| equation |
equation := 'S:t=beta*S*I' parseAsODEEquation.
self assert:(equation generateEvents size) equals:1