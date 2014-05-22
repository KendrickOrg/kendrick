as yet unclassified
indexOf: y in: probs
	|id c|
	id := OrderedCollection new.
	c := 1.
	[ c <= (y size) ] whileTrue: [ 
		|i oc tmp|
		tmp := y at: c.
		i := probs indexOf: tmp.
		oc := y occurrencesOf: tmp.
		1 to: oc do: [ :j|
			id add: i.
			i := ((probs copyFrom: (i+1) to: (probs size)) indexOf: tmp) + i
			 ].
		c := c + oc		
	 ].
	^ id
	
	