as yet unclassified
buildFromAttributes: namesOfAttributes compartments: arrayOfAssociation
	"buildFrom: #(#status #country) compartments: {#(#S #VietNam)->99999. #(...)->...}"
	|associations f keyFormat keyValue|
	associations := OrderedCollection new.
	f := [ :a :b|
		|arr|
		arr := Array new: a size.
		1 to: a size do: [ :i| arr at: i put: ((a at: i)->(b at: i)) ].
		Dictionary newFrom: arr
		].
	namesOfAttributes isArray 
	ifFalse: [ 
		keyFormat := Array with: namesOfAttributes.
		keyValue := arrayOfAssociation collect: [ :e| Array with: e key ] ]
	ifTrue: [ 
		keyFormat := namesOfAttributes.
		keyValue := arrayOfAssociation collect: [ :e| e key ] ].
	1 to: arrayOfAssociation size do: [ :i| 
		associations add: ((f value: keyFormat value: (keyValue at: i))->(arrayOfAssociation at: i) value)
		 ].
	initCompartments := Dictionary newFrom: associations.
	self population compartments: initCompartments
	