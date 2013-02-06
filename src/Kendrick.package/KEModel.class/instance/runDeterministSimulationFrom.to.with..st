as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step
	| solverRK |
	solverRK := RungeKuttaSolver on: self.
	solverRK finalValueOfX: xn.
	solverRK initialValueOfX: x0.
	solverRK stepSize: step.
	result := solverRK rk4Solve.
	^ result