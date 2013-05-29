as yet unclassified
runDeterministSimulationFrom: x0 to: xn withStep: step

	simulator := (KEDeterministicSimulator new) tMin: x0; tMax: xn; step: step; model: self; algorithm: #RK4.
	data := simulator execute.
	^ data.
