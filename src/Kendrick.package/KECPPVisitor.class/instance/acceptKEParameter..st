as yet unclassified
acceptKEParameter: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	parameters at: arg1 symbol put: arg1 value.
	arg1 value isInterval
		ifTrue: [ ^ tmp1 contents ].
	arg1 value isArray
		ifTrue: [ tmp1
				nextPutAll: 'const double ' , arg1 symbol asString;
				nextPutAll: (self prepareArray: arg1 value);
				nextPutAll: (self printArray: arg1 value);
				nextPutAll: ';';
				cr ]
		ifFalse: [ tmp1
				nextPutAll:
					'const double ' , arg1 symbol asString , ' = '
						, arg1 value asFloat asString , ';';
				cr ].
	^ tmp1 contents