accessing
initCompartments
	"initialize all compartments with a size of 0"

	initCompartments ifNil: [ initCompartments := Dictionary newFrom: (self compartmentNames collect: [ :c | c -> 0 ]) ].
	^ initCompartments