grammar
number
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) token trim