tests
testExperimentHasName
	| experiment |
	experiment := KEExperiment new.
	experiment name: #experiment1.
	self assert: experiment name equals: #experiment1