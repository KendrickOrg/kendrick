
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationCreateAnEventThatAddOneIndividual

| e |
e := PPODEParser parse:'S:t=beta*S*I'.
self assert:(e events any isAddingOneIndividualFrom: #S) equals:true! !
