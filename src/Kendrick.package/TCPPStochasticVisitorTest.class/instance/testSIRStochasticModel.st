as yet unclassified 
testSIRStochasticModel
	| model visitor simulator |
	model := KEModel new population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	"ThanhNT 6/7"
	"model atCompartment: #S putNumberOfIndividuals: 1e5 - 1."
	"model atCompartment: #I putNumberOfIndividuals: 1."
	"model atCompartment: #R putNumberOfIndividuals: 0."
	model atCompartment: { #status->#S } put: 1e5 - 1.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.

	"model atParameter: #beta put: 0.0052."
	"model atParameter: #gamma put: 365 / 7."
	model addParameters: { 
				#beta->0.0052.
				#gamma->(365/7)
				 }.	
	"Endof ThanhNT 6/7"
	model addEquation: ('S:t=-beta*S*I').
	model addEquation: ('I:t=beta*S*I-gamma*I').
	model addEquation: ('R:t=gamma*I').
	"ThanhNT 6/7"
	"model runStochasticSimulationFrom: 0 to: 50/365 withStep:  0.5 / 365."
	"Endof ThanhNT 6/7"
	simulator := KEStochasticSimulator new.
	simulator tMin: 0.
	simulator tMax: 50 / 365.
	simulator step: 0.5 / 365.
	"simulator from: 0.0 to: 100*365 step: 1."
	simulator executeOn: model.
	visitor := TCPPStochasticVisitor  new.
	visitor simulator: simulator.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	
	self assert: (visitor parameters size) = 2.
	self assert: (visitor parameters size) = 4.
	