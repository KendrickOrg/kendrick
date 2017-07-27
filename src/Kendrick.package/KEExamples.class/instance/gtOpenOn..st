as yet unclassified
gtOpenOn: arg1
	| tmp2 tmp3 tmp4 |
	self gtExamples
		do: [ :arg2 | 
			[ tmp4 := self perform: (arg2 , #Icon) asSymbol ]
				on: Error
				do: [ tmp4 := self defaultIcon ].
			tmp2 := Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: tmp4 readStream).
			tmp3 := (RTBitmap new form: tmp2) elementOn: arg2.
			tmp3
				@ (RTPopup new text: arg2 selector asString);
				@ (RTEventForwarder new eventClass: TRMouseDragging).
			arg1 add: tmp3 ].
	RTGridLayout new on: arg1 elements