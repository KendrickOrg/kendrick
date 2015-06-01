A KESimulator is an abstract class for simulator of system. All different simulators shoud extend this class and implement the method executeOn:

Instance Variables
	algorithm:	<Symbol>
	data:		<Dictionary<Symbol><KETimeSeries>>
	model:		<KEModel>
	step:		<Number>
	tMax:		<Number>
	tMin:		<Number>

algorithm
	- xxxxx

data
	- xxxxx

model
	- xxxxx

adapters
	- A list of adapters added into model. Each adapter is responsible for a particular task, related to the specific aspect of domain

step
	- xxxxx

tMax
	- xxxxx

tMin
	- xxxxx
