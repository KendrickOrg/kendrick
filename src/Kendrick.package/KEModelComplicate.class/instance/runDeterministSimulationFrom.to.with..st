as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step

| solverRK yy|
solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step. 

yy := solverRK solver2: self.
^ yy
		


 