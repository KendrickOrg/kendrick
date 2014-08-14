accessing
run: algorithm from: tMin to: tMax step: step
	|countStep|
	"simulatorClass := KESimulator passType: algorithm.
	simulator := simulatorClass new: algorithm tMin: tMin tMax: tMax step: step model: self.
	self constructRuntimeImpls.
	countStep := 'Step: ', simulator execute asString."
	simulatorBuilder new: algorithm tMin: tMin tMax: tMax step: step model: self.
	countStep := 'Step: ', simulatorBuilder execute asString.
	Transcript show: countStep;cr.
	