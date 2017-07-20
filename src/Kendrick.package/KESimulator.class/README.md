A KESimulator is an abstract class for simulator for Kendrick models. All different simulators shoud extend this class and implement the method executeOn:

Instance Variables
	model:		<KEModel>
	step:		<Number>
	tMax:		<Number>
	tMin:		<Number>
	timeSeries: 	<Collection>
		
model
	- a KEModel that the simulator will use

step
	- 

tMax
	- final time of the simulation

tMin
	- initial time of the simulation
