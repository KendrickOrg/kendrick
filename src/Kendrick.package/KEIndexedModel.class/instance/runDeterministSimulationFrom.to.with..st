as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step

| solverRK yy|
solverRK := RungeKuttaSolver on: self.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step. 

yy := solverRK rk4Solve2.
^ yy
		


 