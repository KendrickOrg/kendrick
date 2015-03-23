accessing
printOn: aStream
	|f t|
	from isSymbol ifTrue: [ f := from asString ] ifFalse: [ f := from values collect: [ :v| (v asString) ]].
	to isSymbol ifTrue: [ t := to asString ] ifFalse: [ t := to values collect: [ :v| (v asString) ]].
	aStream nextPutAll: f asString, '-->', t asString