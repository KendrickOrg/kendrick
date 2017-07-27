as yet unclassified
openOn: arg1
	| tmp1 tmp2 tmp4 tmp5 tmp6 |
	tmp1 := self class selectors
		select: [ :arg2 | (arg2 beginsWith: 'example') and: [ (arg2 endsWith: 'Icon') not ] ].
	tmp1
		do: [ :arg3 | 
			[ tmp6 := self perform: (arg3 , #Icon) asSymbol ]
				on: Error
				do: [ tmp6 := self defaultIcon ].
			tmp4 := Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: tmp6 readStream).
			tmp5 := (RTBitmap new form: tmp4) element.
			tmp5
				@ (RTPopup new text: arg3 asString);
				when: TRMouseLeftClick
					do: [ :arg4 | self class new perform: arg3 ];
				when: TRMouseRightClick
					do: [ :arg5 | (self class >> arg3) browse ];
				@ (RTEventForwarder new eventClass: TRMouseDragging).
			arg1 add: tmp5 ].
	RTGridLayout new on: arg1 elements.
	arg1 canvas
		addMenu: 'back'
		callback: [ self pressedBackButtonOn: arg1 ].
	tmp2 := TRLabelShape new text: ' Left to run / Right for code'.
	arg1 canvas addFixedShape: tmp2.
	TRConstraint stickAtTheBottomOfTheWindow: tmp2