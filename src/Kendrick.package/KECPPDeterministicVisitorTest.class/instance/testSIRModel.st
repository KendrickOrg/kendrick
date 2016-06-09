as yet unclassified
testSIRModel
	| model visitor simulator|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
		
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 step: 0.0027.
	simulator executeOn: model.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 2.