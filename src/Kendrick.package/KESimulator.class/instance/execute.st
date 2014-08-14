accessing
execute
	self adapters ifNotNil: [ 
		self adapters do: [ :anAdapter| anAdapter init ]
		 ] 