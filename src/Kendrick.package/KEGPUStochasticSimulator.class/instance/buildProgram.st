initialize OpenCL
buildProgram
	program := context createProgramWithSource: self programSource.
	program buildProgramFor: device options: ''
	