adding
probabilityOfContactsOf: source with: destination
	"In the meta-model, the model is under an assumption of homogenous mixing"
	"destination: associations, source: dictionary"
	|tmp|
	tmp := source copy.
	tmp = #population 
	ifTrue: [ tmp := Dictionary newFrom: destination ]
	ifFalse: [ destination do: [ :each| tmp at: each key put: each value ] ].
	tmp removeKey: #id ifAbsent: [ tmp ].
	^ (self compartments at: tmp)