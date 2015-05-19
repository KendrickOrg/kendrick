accessing
data
	"<MSEProperty: #data type: #Dictionary>
	<multivalued>"
	data ifNil: [ 
		data := KEOutputData from: (model population compartments keys)
		 ].
	^ data