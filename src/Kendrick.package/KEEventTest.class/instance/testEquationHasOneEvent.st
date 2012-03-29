as yet unclassified
testEquationHasOneEvent

| e |
e := PPODEParser parse:'S:t=beta*S*I'.
self assert:(e events size) equals:1