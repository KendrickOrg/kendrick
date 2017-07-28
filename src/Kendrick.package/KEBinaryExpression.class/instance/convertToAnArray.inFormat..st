private
convertToAnArray: aNumber inFormat: anArray
	"Created by ThanhNT 26/7/17"
	|tmp|
	aNumber isArray ifTrue: [ ^aNumber ].
	aNumber isNumber ifTrue: 
		[
			tmp := anArray clone.
			self fromNumber: aNumber to: tmp.
			^tmp.
		].
	^nil.