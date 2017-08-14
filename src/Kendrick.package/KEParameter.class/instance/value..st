accessing
value: model
	|s index|
	"ThanhNT 13/7"
	"This statement handles the case that expression is an array"
	(expression isArray) ifTrue: [ ^expression ].
	"Endof ThanhNT 13/7"
	
	"ThanhNT 18/7"
	"These following statements handle the case that expression is an object of Interval"
	"for example: t := (KEParameter new) expression: (10 to: 20)."
	(expression class = Interval) 
		ifTrue: [  
				s := Array new: (expression size).
				index := 1.
				expression do: [ :each| s at: index put: each. index := index + 1].
				^s.
					].
	"Endof ThanhNT 18/7"
	^ expression value: model