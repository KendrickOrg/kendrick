as yet unclassified
testEvaluateContactVariableOfModel
	|model networkAdapter|
	model := self createANetworkSIRModel.
	networkAdapter := KENetworkAdapter new.
	networkAdapter atArgument: #model put: model.
	networkAdapter init.
	model currentSubPopulation: model population.
	model currentIndividual: 81.
	
	self assert: ((model atEquation: #S) evaluateWithModel: model) equals: -0.02.
	