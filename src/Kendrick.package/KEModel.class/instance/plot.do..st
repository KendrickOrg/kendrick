as yet unclassified
plot: aStatus do: aFunction
	aStatus isArray ifTrue: [ 
		aStatus do: [ :each|
			self plot: each do: aFunction.
			 ].
		^ nil.
		 ].
	aFunction = #sqrt ifTrue: [ (data at: aStatus) sqrt plot: aStatus ].
	aFunction = #log ifTrue: [ (data at: aStatus) log plot: aStatus ].
	aFunction ifNil: [ (data at: aStatus) plot: aStatus ].