accessing
do: aFunction
	aFunction = #sqrt ifTrue: [ ^ self sqrt ].
	aFunction = #log ifTrue: [ ^ self log ].
	aFunction ifNil: [ ^ self ]