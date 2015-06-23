kernels
programSource
	^ '
	
__kernel void updatePropensity(__constant float* ratesVector, 
										__global   int* reactantVector, 
										__global   float* propensityVector 
										)
 {
	
	size_t id = get_global_id(0);
		
	propensityVector[id] =  ratesVector[id] * reactantVector[id];
	
}

__kernel void updateSpecies(__global int* speciesVector,
									__constant float* stoichioVector,
									int indexFiredReaction, 
									int numSpecies)
 {
	
	size_t id = get_global_id(0);
		
	speciesVector[id] = speciesVector[id] + stoichioVector[indexFiredReaction * numSpecies + id];
		
}

'