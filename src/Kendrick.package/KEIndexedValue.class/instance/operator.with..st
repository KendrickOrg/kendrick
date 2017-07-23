private
operator: strType with: aValue
	|tmp|
	tmp := 0.
	value do: [ 
		:each|
		|t|
		tmp := tmp + 1.
		t := OrderedCollection new.
		t add: tmp.
		self calculate: each operate: strType with: aValue at: t.
		 ].