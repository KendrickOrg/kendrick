test
exampleCreateIndexedValue
	"self new exampleCreateIndexedValue"
	| arr |
	arr := self createArrayFromIndexListAndIndexValue.
	"arr is an array to store value: I[i] with i := from (1 to 2)"
	self assert: (arr) equals: #(25 25)