test
testGetValuesFromCompartmentNames
	"self new testGetValuesFromCompartmentNames"
	|model tmp array indexValues compNames|
	model := self modelSIRMultiHostsMultiSpatials.

	tmp := KEIndexedVariable new.
	tmp symbol: #I.
   tmp addIndex: (KEVariable new symbol: #i);
  		 addIndex: (KEVariable new symbol: #j).
	
	indexValues  := (tmp indexList) collect: [ :each| each evaluateWithModel: model].
	self assert: (indexValues at: 1) equals: 1.
	self assert: (indexValues at: 2) equals: 2.
	
	compNames := tmp findKeysAt: model FromIndexedValues: indexValues.
	self assert: compNames equals: '#I#human#lyon#'.
	
	array := tmp getValueFromCompartmentsName: compNames at: model.
	self assert: (array) equals: 500.