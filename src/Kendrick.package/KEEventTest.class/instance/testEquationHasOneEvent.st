tests
testEquationHasOneEvent

| equation |
equation := 'S:t=beta*S*I' parseAsAnEquation.
self assert:(equation generateEvents size) equals:1