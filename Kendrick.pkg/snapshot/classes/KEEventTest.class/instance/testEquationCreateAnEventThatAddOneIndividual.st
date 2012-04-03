
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationCreateAnEventThatAddOneIndividual

| e |
e := 'S:t=beta*S*I' parseAsODEEquation.
self assert:(e events any isAddingOneIndividualFrom: #S) equals:true! !
