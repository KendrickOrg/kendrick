as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step
	| solverRK diag xValue |
	solverRK := RungeKuttaSolver on: self.
	solverRK initialValueOfX: x0.
	solverRK finalValueOfX: xn.
	solverRK stepSize: step.
	result := solverRK rk4Solve.
	^ result