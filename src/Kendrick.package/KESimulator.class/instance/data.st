accessing
data
	"<MSEProperty: #data type: #Dictionary>
	<multivalued>"
	data ifNil: [ 
		data := KEOutputData from: (model compartments keys)
		 ].
	^ data