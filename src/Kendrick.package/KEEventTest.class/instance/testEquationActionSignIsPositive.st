as yet unclassified
testEquationActionSignIsPositive

| e |
e := PPODEParser parse:'S:t=beta*S*I'.
self assert:(e events any actions second) equals:1