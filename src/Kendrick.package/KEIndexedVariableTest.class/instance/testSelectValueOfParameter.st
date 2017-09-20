tests
testSelectValueOfParameter
	| model tmp |
	model := self modelSIRMultiHost.
	tmp := KEIndexedVariable symbol: #beta.
	tmp addIndex: (KEVariable symbol: #i).
	tmp addIndex: (KEVariable symbol: #c).	"c = 1"

	"beta[i][1]"
	self assert: (tmp evaluateWithModel: model) equals: #(0 0.02 0.02)