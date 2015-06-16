as yet unclassified
programSource11
	^ '
__kernel void sSA( __global float * VectorTransitions, __global int * Q, __global uint * global_x, __global float *global_c, __global float *T,__global int M,__global int N, __global int * TypeEvent, __global float2* EventLeft)
 {
	__local  uint x [N];  // N represents the total number of species
	__local  int xx [N];
	__local  c[M];          // M represents the total number of events
	__local float a[M];
	__local float sum_a, sum;
	__local float deltaT;  // time step
	__local float p;
	__local float r1, r2;  // Random number generated
	__local int eureka;
	__local firstReactant, secondReactant;
	__local float2 eventLeftLocalM]; 
	__local unsigned int seed,seed1;
	__local int i, j, r, s;   // index for loops
	
	i = j = r = s = 0;
			
	size_t tid = get_global_id(0);
	size_t sid = get_local_id(0);
	
	If (Q[tid] != 0 )
		return; 
	
	// copy global buffers into local memory -- Other option async_work_group_copy(des, src, size, event)
	x[sid] = global_x[tid];
	c[sid] = global_c[tid];	
	eventLeftLocal[sid] = eventLeft[tid];

	 for( i=0; i < 1; i++) {	
		
		// Update probabilities of each event
		for(i=0; i < M; i++) {
			if(TypeEvent[i] == 0) {   //  *--> X
				a[i] = c[i]* ;
			}
			else
			if(TypeEvent[i] == 1){   // X --> ...
				firstReactant = EventLeftLocal[i].x;    // index of first reactant
				a[i] = c[i] * x[firstReactant]; 
			}
			else
			if(TypeEvent[i] == 2) {   // X + Y --> ...	
				firstReactant = EventLeftLocal[i].x;    		// index of first reactant
				secondReactant = EventLeftLocal[i].y;    	// index of second reactant
				a[i] = c[i] * x[firstReactant] * x[secondReactant];	
			}					
		}
		// compute the sum of probabilities 
		sum_a = 0;
		for (i=0; i<M; i++) {
			sum_a = sum_a + a[i];
		}
		if (sum_a == 0) {
			// store in buffer of simulation data.
			return;
		}
		// calculate deltaT
		seed = seed_memory[tid];
		r1 = get_random_0_1_ul (&seed);
		seed_memory[tid] = *seed;
	
		deltaT = (1/sum_a) * ln(1/r1);
	
		// Choose event that will be handled
		seed1 = seed_memory[tid];
		r2 = get_random_0_1_ul (&seed1);
		seed_memory[tid] = *seed1;
		p = r2 * sum_a;
		
		eureka = -1;
		sum = 0;
		j=0;
		While((j < M) && (eureka == -1)) {
			sum = sum + a[j];
			if(sum > p) 
				eureka = j;
			else 
				j++; 
		}
		
		// Update time  and system 
		T[tid] =  T[tid] + deltaT;
		for(i = 0; i){
			x[i] = x[i] + VectorTransitions[j * N + i];
		}
			
		// Now save the simualtion data on arrays that will be back to host.
	}
	
	// async_work_group_copy(des, src, size, event)		 
	async_work_group_copy(global_x, x, N, 0);
}
/*	float get_random_0_1_ul (unsigned int* seed) //uniform between 0-1
{
  *seed = ((*seed) * 16807 ) % 2147483647;
  return  (float)(*seed) * 1/2147483647;   //(4.6566129e-10 = 1/(2^31-1) = 1/2147483647)
}*/
	'