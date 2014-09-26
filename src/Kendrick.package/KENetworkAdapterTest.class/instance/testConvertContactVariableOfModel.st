as yet unclassified
testConvertContactVariableOfModel
	|model networkAdapter|
	model := self createANetworkSIRModel.
	networkAdapter := KENetworkAdapter new.
	networkAdapter atArgument: #model put: model.
	networkAdapter init.
	
	self assert: (model atEquation: #S) variable isAContactVariable  equals: true.
	self assert: (model atEquation: #I) variable isAContactVariable  equals: true.
	self assert: (model atEquation: #R) variable isAContactVariable  equals: true.