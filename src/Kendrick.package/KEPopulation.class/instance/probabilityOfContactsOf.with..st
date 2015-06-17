adding
probabilityOfContactsOf: source with: destination
	"In the meta-model, the model is under an assumption of homogenous mixing"
	"destination: associations, source: dictionary"
	|tmp p|
	tmp := source copy.
	tmp = #population 
	ifTrue: [ tmp := Dictionary newFrom: destination ]
	ifFalse: [ destination do: [ :each| tmp at: each key put: each value ] ].
	tmp removeKey: #id ifAbsent: [ tmp ].
	p := self compartments at: tmp.
	"if mass-action = true and rescale = false, do p/N"
	((configurations at: #mass_action) and: [ (configurations at: #rescale) not ])
	ifTrue: [ p := p / (self sizeOfPopulation: tmp) ].
	^ p