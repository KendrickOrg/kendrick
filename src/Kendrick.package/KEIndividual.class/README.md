A KEIndividual represents an individual in the system. Each individual has its own attributes such as: currentStatus, nextStatus, position, age, ...

Instance Variables
	attributes:		<Dictionary>
	behaviorBuilder:		<KEBehaviorBuilder>

attributes
	- A list of attributes of an individual. An attribute could be simple with symbol and value or may be an instance of KEAttribute that defines the effect on probability of contact of this individual to others.

behaviorBuilder
	- The behaviorBuilder is responsible for executing the behavior of this individual, this could be change status, move to other position...
