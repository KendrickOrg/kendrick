as yet unclassified
programSource
	^ '
	
__kernel void updatePropensity(__global int* speciesVector,
							__constant float* ratesVector, 
							__constant float* stoichioVector,
							__constant int* reactantVector, 
							__global float *propensityVector, 
							int numSpecies,
							int numReactions)
 {
	
	size_t id = get_global_id(0);
		
	propensityVector[id] =  ratesVector[id] * speciesVector[reactantVector[id]];
	
}

__kernel void updateSpecies(__global int* speciesVector,
						__constant float* stoichioVector,
						int indexFiredReaction, 
						int numSpecies,
						int numReactions)
 {
	
	size_t id = get_global_id(0);
		
	speciesVector[id] = speciesVector[id] + stoichioVector[indexFiredReaction * numSpecies + id];
	//speciesVector[id] = speciesVector[id] + 5;
	
}


__kernel void ratesBy(__global float* ratesVector)
 {
	
	size_t id = get_global_id(0);
		
	ratesVector[id] = ratesVector[id] * 2;
	
}

'