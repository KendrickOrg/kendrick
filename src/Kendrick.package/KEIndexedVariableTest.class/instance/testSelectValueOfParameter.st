tests
testSelectValueOfParameter
	"self new testSelectValueOfParameter"

	| model tmp |
	model := self modelSIRMultiHost.
	tmp := KEIndexedVariable symbol: #beta.
	tmp addIndex: (KEVariable symbol: #i).
	tmp addIndex: (KENumerical new number: 1).
	"beta[i][1]"
	self assert: (tmp evaluateWithModel: model) equals: #(0 0.02 0.02)