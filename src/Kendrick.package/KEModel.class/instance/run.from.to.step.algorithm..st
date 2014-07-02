accessing
run: type from: tMin to: tMax step: step algorithm: algorithm
	|countStep simulatorClass|
	simulatorClass := KESimulator passType: type.
	simulator := simulatorClass new: algorithm tMin: tMin tMax: tMax step: step model: self.
	self constructRuntimeImpls.
	countStep := 'Step: ', simulator execute asString.
	Transcript show: countStep;cr.
	