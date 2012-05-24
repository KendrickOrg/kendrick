as yet unclassified
runDeterministSimulationFrom: x0 to: xn with: step

| solverRK diag xValue |
solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: xn.
solverRK initialValueOfX: x0.
solverRK stepSize: step.
result := solverRK solver: self
