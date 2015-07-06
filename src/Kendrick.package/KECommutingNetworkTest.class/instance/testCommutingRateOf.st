as yet unclassified
testCommutingRateOf
	|network rate|
	network := self createCommutingNetworkForTesting.
	rate := network commutingRateOf: (network atNode: 1).
	
	self assert: rate equals: 0.05