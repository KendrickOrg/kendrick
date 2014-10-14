accessing
name
	|aName p|
	name ifNil: [ 
		aName := ''.
		p := self.
		[ p parent isNotNil ] whileTrue: [ 
			aName := p populationID asString, aName.
			p := p parent
			 ].
		p parent isNil ifTrue: [ aName := '0', aName ].
		name := aName asSymbol
		 ].
	^ name 