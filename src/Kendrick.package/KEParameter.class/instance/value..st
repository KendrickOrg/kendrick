accessing
value: model
	"ThanhNT 13/7"
	"This statement handles the case that expression is an array"
	(expression isArray) ifTrue: [ ^expression ].
	"Endof ThanhNT 13/7"
	^ expression value: model