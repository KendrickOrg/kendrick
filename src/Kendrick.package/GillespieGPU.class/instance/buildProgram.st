as yet unclassified
buildProgram
	program := context createProgramWithSource: self programSource.
	self assert: program notNil.
	program buildProgramFor: device options: ''
	