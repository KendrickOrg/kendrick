tests
testFindValuesFromIndexedValues
	"self new testFindValuesFromIndexedValues"
	|model tmp array indexValues|
	model := self modelSIRDemoMultiConcerns.
	
	
	tmp := KEIndexedVariable new.
	tmp symbol: #I.
   tmp addIndex: (KEVariable new symbol: #i).
	
	indexValues  := (tmp indexList) collect: [ :each| each evaluateWithModel: model].
	self assert: (indexValues at: 1) equals: #(1 2).

	array := tmp findValuesFrom: indexValues at: model.
	self assert: (array) equals: #(25 25).