as yet unclassified
checkAllPositive: anArray
	"Created by ThanhNT 19/7"
	"Purpose: Determine all elements of an Array are positive or not."
	"This function will return true if all of them are positive"
	"self new checkAllPositive: #(1 2 4 5 6 -7)"
	|check|
	anArray isNumber ifTrue: [ ^(anArray > 0) ].
	anArray isArray ifTrue: [ 
		check := true.
		anArray do: [ :each| 
			check := check & (self checkAllPositive: each).
			check ifFalse: [ ^check ].
			].
		^check.
		 ].
	^false.