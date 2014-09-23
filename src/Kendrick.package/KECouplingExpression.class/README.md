A KECouplingExpression is an expression which is automatically generated for ODE equation in a model with meta-population and having a graph that describes the interaction between sub-populations.

Instance variables:
	- couplingExpression:            <KEExpression>
	- variable                            <Symbol>
	
couplingExpression:
	- An expression that represents the coupling infection in a model with meta-population and having a graph that describes the interaction between sub-populations
	
variable
	- The name of the compartment related to the coupling expression
	
example: -beta*S*I ==> coupling expression: -beta*I, variable S 


  