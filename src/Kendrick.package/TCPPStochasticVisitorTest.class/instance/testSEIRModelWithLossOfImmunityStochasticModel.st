as yet unclassified 
testSEIRModelWithLossOfImmunityStochasticModel
	| model visitor simulator |
	model := KEModel new population: (KEPopulation size: 100001).
	"ThanhNT 10/7"
	"model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0."
	model addAttribute: #status value: #(S E I R).
	model atCompartment: {#status->#S} put: 99999.
	model atCompartment: {#status->#E} put: 1.
	model atCompartment: {#status->#I} put: 1.
	model atCompartment: {#status->#R} put: 0.
	"Endof ThanhNT 10/7"
	model atParameter: {#beta->0.0052}.
	model atParameter: {#gamma->(365 / 7)}.
	model atParameter: {#sigma->(365 / 7)}.
	model atParameter: {#mu->(1 / 80)}.
	model atParameter: {#to->2}.
	model atParameter: {#N->100000}.
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S+to*R').
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R-to*R').
	simulator := ((KEStochasticSimulator new) tMin: 0.0; tMax: 1.0; step: 0.001; model: model; algorithm: #GillespieDirect).
	"ThanhNT 10/7"
	"model generateEvents."
	simulator executeOn: model.
	"Endof ThanhNT 10/7"
	visitor := TCPPStochasticVisitor  new.
	visitor simulator: simulator.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 2.
	