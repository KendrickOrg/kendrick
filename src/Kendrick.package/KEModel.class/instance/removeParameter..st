accessing
removeParameter: aParam
	^ parameters remove: aParam ifAbsent: [ ^ nil ]