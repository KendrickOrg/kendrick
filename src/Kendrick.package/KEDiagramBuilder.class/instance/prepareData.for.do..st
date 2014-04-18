accessing
prepareData: data for: input do: aFunction
	"This function will reformulate the data input before create a diagram. As output of simulator, data is a Dictionary"
	|models|
	input isSymbol ifTrue: [ 
		models := data at: input ifAbsent: [ ^ self get: input from: data do: aFunction ].
		models isCollection ifFalse: [ ^ models do: aFunction ].
		^ models
		 ].
	input isArray ifTrue: [ 
		models := OrderedCollection new.
		input do: [ :each|
			models addLast: ((data at: each) do: aFunction)
			 ].
		^ models
		 ]