test
createArrayFromIndexListAndIndexValue
	"self new createArrayFromIndexListAndIndexValue"
	|model tmp array indexList indexValues|
	model := self modelRK4SolverOnSIRDemoMultiConcerns.
	tmp := KEIndexedVariable new.
	tmp symbol: #I.
	indexList := OrderedCollection new: 1.
	indexList add: #k.
	indexValues  := OrderedCollection new: 2.
	indexValues add: #(1 2).
	array := tmp findValuesFrom: indexValues at: model.
	^array.