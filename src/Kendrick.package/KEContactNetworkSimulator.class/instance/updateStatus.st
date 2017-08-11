run
updateStatus
"Ask each nodes to update its infectious status"
	network nodes do: [ :each | each updateStatus ]