accessing
events
	"Store rates of population for increasing the speed of simulation"
	<MSEProperty: #events type: #OrderedCollection>
	events ifNil: [ events := OrderedCollection new ].
	^ events