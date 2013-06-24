as yet unclassified
runStochasticSimulationFrom: tMin to: tMax withStep: step
	simulator := (KEStochasticSimulator new) tMin: tMin; tMax: tMax; step: step; model: self; algorithm: #GillespieDirect.
	data := simulator execute.
	^ data.

 