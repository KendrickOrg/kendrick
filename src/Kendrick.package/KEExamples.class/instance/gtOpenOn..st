as yet unclassified
gtOpenOn: v
	|  icon64Mime form element  |
	self gtExamples do: [ :anExample |
		[icon64Mime := self perform: (anExample, #Icon) asSymbol.] 
		on: Error do: 
		[ icon64Mime := self defaultIcon].
		form := TRPlatform current formClass fromBinaryStream: 
							(TRPlatform current mimeDecodeToBytes: icon64Mime readStream).
		element := (RTBitmap new form: form) elementOn: anExample.
		element @ (RTPopup new text: anExample selector asString).
		element @ (RTEventForwarder new eventClass: TRMouseDragging). 
		v add: element ].

	RTGridLayout new on: v elements.
	