run
step
	network nodes do: [ :n | self stepNode: n ].
	
	self updateStatus