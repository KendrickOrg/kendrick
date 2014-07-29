accessing
atParameter: parameter
	parameters ifNil: [ ^ nil ].
	^ parameters at: parameter ifAbsent: [ ^ nil ]