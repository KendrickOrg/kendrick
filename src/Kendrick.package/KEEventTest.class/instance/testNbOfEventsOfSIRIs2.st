as yet unclassified
testNbOfEventsOfSIRIs2

|  model s i r dsdt didt drdt l ex a c b d count t |
model := KEModel new.

model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.

model atParameter: #beta put: 520.
model atParameter: #gamma put: 365/7.

dsdt := 'S:t=-beta*S*I' parseAsODEEquation.
didt := 'I:t=beta*S*I-gamma*I' parseAsODEEquation.
drdt := 'R:t=gamma*I' parseAsODEEquation.

model addEquation: dsdt.
model addEquation: didt.
model addEquation: drdt.
l := model generateEvents.
count := 0.
l do:[:each|
	ex := each rate.
	count = 0 ifTrue:[a := ex].
	count = 1 ifTrue:[b := ex].
	count = 2 ifTrue:[c := ex].
	count = 3 ifTrue:[d := ex]. 
	count := count + 1.	
	].
a isUnaryExpression ifTrue:[a := a negated].
b isUnaryExpression ifTrue:[b := b negated].
c isUnaryExpression ifTrue:[c := c negated].
d isUnaryExpression ifTrue:[d := d negated].
t := false.
(a = b) ifTrue:[t := true].
(a = c) ifTrue:[t := true].
(a = d) ifTrue:[t := true].
self assert: true equals: t
"self assert: 2  equals: l size"