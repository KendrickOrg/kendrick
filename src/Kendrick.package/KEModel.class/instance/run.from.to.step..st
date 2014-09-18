accessing
run: algorithm from: tMin to: tMax step: step

	simulatorBuilder new: algorithm tMin: tMin tMax: tMax step: step model: self.
	simulatorBuilder execute