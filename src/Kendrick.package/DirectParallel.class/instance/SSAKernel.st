kernels
SSAKernel
	<embeddedObject>
	^ '
//  Parallel Gillespie Stochastic Simulation Algorithm kernel

__kernel void SSA( __global float4 * VectorTransitions, __global uint * global_x, __global float *global_c, __global float *T, int M, int N )
 {
	__local  uint x [N];  // N represents the total number of species
	__local  int xx [N];
	__local  c[M];          // M represents the total number of events
	__local float a[M];
	__local float sum_a, sum;
	__local float tau;  // time step
	__local float p;
	__local float r1, r2;  // Random number generated
	__local int eureka;
	
	int i, j, r, s;   // index for loops
	
	i = j = r = s = 0;
			
	size_t tid = get_global_id(0);
	size_t sid = get_local_id(0);
	
	//copy global buffers into loacl memory -- Other option async_work_group_copy(des, src, size, event)
	x[sid] = global_x[tid];
	c[sid] = global_c[tid];	
	
	 for( i=0; i < 100; i++) {	
		// Update probabilities of each event. Here we supose that we have five events: Transmission, revovery, death of S, death of I, and death of R.
		a[0] = c[0] * x[0] * x[1] ;   //  beta * S * I 
		a[1] = c[1] * x[1];              //   gama * I
		a[2] = c[2] * x[0];               //   mu* S
		a[3] = c[2] * x[1];               //   mu* I
		a[4] = c[2] * x[2];               //   mu* R
	
		// compute the sum of probabilities by avoiding loop use
		sum_a = a[0] +  a[1] + a[2] + a[3] + a[4];
		if (sum_a == 0) {
			// store in buffer of simulation data.
			return;
		}
		// calculate Tau
		r1 = generateRandomNumber();   // function that will be defined in host or device
		tau = (1/sum_a) * ln(1/r1);
	
		// Choose event that will be handled
		r2 = generateRandomNumber();
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
		}
		// Update time  and system 
		T[tid] =  T[tid] + tau;
		x[0] = x[0] + VectorTransitions[j].x;
		x[1] = x[1] + VectorTransitions[j].y;
		x[2] = x[2] + VectorTransitions[j].z;		
			
		// Now save the simualtion data on arrays that will be back to host.
	}
	
	// async_work_group_copy(des, src, size, event)		 
	async_work_group_copy(global_x, x, N, 0);
}
	
	'