A KESimulator is an abstract class for simulator of system. All different simulators shoud extend this class and implement the method execute. Each simulator will have a list of adapters, each adapter has its own responsibility related to a specific aspect of domain. By default, if no more adapter added in model, KEEventAdapter is added.

Instance Variables
	algorithm:	<Symbol>
	data:		<Dictionary<Symbol><KETimeSeries>>
	model:		<KEModel>
	adapters:	<OrderedCollection<KERuntimeAdapter>>
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
