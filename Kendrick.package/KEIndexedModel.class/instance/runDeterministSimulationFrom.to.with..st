as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step
	| solverRK |
	solverRK := RungeKuttaSolver on: self.
	solverRK initialValueOfX: x0.
	solverRK finalValueOfX: xn.
	solverRK stepSize: step.
	result := solverRK rk4Solve2.
	^ result