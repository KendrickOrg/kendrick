as yet unclassified
indexOf: y in: Y
	|id c|
	id := OrderedCollection new.
	c := 1.
	[ c <= (y size) ] whileTrue: [ 
		|i  tmp|
		tmp := y at: c.
		i := Y indexOf: tmp.
		[ i > 0 ] whileTrue: [ 
			id add: i.
			c := c+1.
			i := Y indexOf: tmp startingAt: (i+1).
		 ]
	 ].
	^ id
	
	