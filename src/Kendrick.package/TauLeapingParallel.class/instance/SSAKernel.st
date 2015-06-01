kernels
SSAKernel
	<embeddedObject>
	^ '__kernel void Tauleap( __global float4 * VectorTransitions, __global uint * global_x, __global float *global_c, __global float * Q, __global float *T, int M, int N, int epsilon)
 {
	__local  uint x [N];  // N represents the total number of species
	__local  int xx [N];
	__local  c[M];          // M represents the total number of events
	__local float a[M];
	__local float XY[M];           // Buffer of critical/non-critical events
	__local float XYnC[M];     // Buffer of non-critical events
	__local int K[M];
	__local float2 MuSigmaArray[N];
	__local float Tau[N];
	__local float Part1Tau, Part2Tau;
	__local float u;
	//__local float4  VectorTransitionsLocal[M];
	__local int correct;
	
	float sum_a, sum_aCritical;
	float  tauExactValue, tauPrime, tauSecond;
	int i, j, r, s;   // index for loops
	
	i = j = r = s = 0;
	tauExactValue = tauPrime = tauSecond = tau3 = 0;
	
	for(int init=0; init < N; init++) {
		MuSigmaArray[init].x = 0.0;
		MuSigmaArray[init].y = 0.0;
		Tau[init]  = 0.0;
	}
	
		
	size_t tid = get_global_id(0);
	size_t sid = get_local_id(0);
	//copy global buffers into loacl meory
	x[sid] = global_x[tid];
	c[sid] = global_c[tid];	
	// Other option async_work_group_copy(des, src, size, event)
		
	if (Q[tid] == -1) then 
		return;
	// Update probabilities of each event. Here we supose that we have five events: Transmission, revovery, death of S, death of I, and death of R.
	a[0] = c[0] * x[0] * x[1] ;   //  beta * S * I 
	a[1] = c[1] * x[1];              //   gama * I
	a[2] = c[2] * x[0];               //   mu* S
	a[3] = c[2] * x[1];               //   mu* I
	a[4] = c[2] * x[2];               //   mu* R
	// compute the sum of probabities by avoiding loop use
	sum_a = a[0] +  a[1] + a[2] + a[3] + a[4];
	
	if (sum_a == 0) {
		Q[tid] = -1;
		// store in buffer of simulation data.
	}
	
	//  Determine critical and non-critical events.
	// For transmission and death of species S events 
	
	if (x[0] < 10) {
	     XY[0] = XY[2] = 1;     // critical
	 }
	else { 
	  XY[0] =  XY[2] = 0;        // non-critical
	}
	// For recovery event and death of I
	if (x[1] < 10) {
	     XY[1] = XY[3] = 1;
	 }
	else { 
	  XY[1] = XY[3] = 0; 
	}
	// For death of species R event
	if (x[2] < 10) {
	     XY[4] = 1;
	 }
	else { 
	  XY[4] = 0; 
	}
	j = 0;
	for (i = 0; i < M;  i++) {
		if (XY[i] ==  0) {
			XYnC[j] = i;    // save index of non-critical event
			j++;
		}
	 }
		 // Calculate tau value for  thread tid
	// calculate muForTau
	
	
	// calculate muForTau
	for(r=0; r < j; r++) {
		MuSigmaArray[0].x += VectorTransitions[XYnC[r]].x * a[XYnC[r]];
		MuSigmaArray[0].y += VectorTransitions[XYnC[r]].x * VectorTransitions[XYnC[r]].x * a[XYnC[r]];
	}
	
	for( r=0; r < j; r++) {
		MuSigmaArray[1].x = VectorTransitions[XYnC[r]].y * a[XYnC[r]];
		MuSigmaArray[1].y = VectorTransitions[XYnC[r]].y * VectorTransitions[XYnC[r]].y * a[XYnC[r]];
	}
	for( r=0; r < j; r++) {
		MuSigmaArray[2].x = VectorTransitions[XYnC[r]].z * a[XYnC[r]];
		MuSigmaArray[2].y = VectorTransitions[XYnC[r]].z * VectorTransitions[XYnC[r]].z * a[XYnC[r]];
	}
	
	// computes the tau_i value now and after choose the min tau
	for( i = 0; i < N; i++) {
		u = epsilon * x[i];
		if (u < 1) 
			u = 1;
		Part1Tau =   u/ MuSigmaArray[i].x;
		Part2Tau =   (u*u)/ MuSigmaArray[i].y;
		if (Part1Tau < Part2Tau)
			Tau[i] =  Part1Tau;
		else
			Tau[i] =  Part2Tau;		
	}
	
	tauPrime = Tau[0] ;
	for( i = 1; i < N; i++) {
		if ( Tau[i] < tauPrime)
			tauPrime = Tau[i];
	}
	
	// Estimate value of Tau 
	if ( tauPrime < 10/sum_a) {
		Q[tid] = 0;    // this thread will executes a SSA step with other kernel
		return;
	}
	else {
		Q[tid] = 1;  // // this thread will executes a  step with this kernel
	}
	
	// Method for Tau-leaping step
	// initialize K array for Poisson random distribution
	for( i = 0; i < M; i++) {
		K[i] = 0;
	}
	
	// Calculate sum of probabilities of critical events only
	sum_aCritical = 0.0;    
	for( i = 0; i < M; i++) {
		if (XY[i] = = 1)
			sum_aCritical += a[i];		
	}	
	if (sum_aCritical > 0) {
		r1 = generateRandomNumber();   // function that will be defined in host i.e CPU
		tauSecond = (1/sum_aCritical) * ln(1/r1);
	}
	if (tauPrime < tauSecond )
		tauExactValue = tauPrime;
	else 
		tauExactValue = tauSecond;
		
	if (tauPrime > tauSecond ) {
		j = SingleCriticalEvent();
		K[j] = 1;
	}
	// ,,,,,,,,,,,,,,,,,,
	correct = 1;
	While(correct == 1) {
		for(i=0; i< M; i++) {
			if (XY[i] == 0)
				K[i] = (int) (a[i] * tauExactValue);  // Poisson distribution will be computed efficiently P(x; mu) = (e^-mu) (mu^x) / x!
		}
		// Update system   Someone can see that we avoid using too loops bacause this practice decreases  perfromance
		for (j = 0; j < M; j++ ) {
			x[0] = x[0] + (K[j] * VectorTransitions[j].x);
		}
		for (j = 0; j < M; j++ ) {
			x[1] = x[1] + (K[j] * VectorTransitions[j].x);
		}
		for (j = 0; j < M; j++ ) {
			x[2] = x[2] + (K[j] * VectorTransitions[j].x);
		}
		// Now we check if S,I, and R values are correct ie not negative
		if ((x[0] > 0) && (x[1] > 0) && (x[2] > 0))
			correct = 0;
		else
			tauExactValue = tauExactValue/2;
	}
	//,,,,,,,,,,,,,,,,,,,,,
	
	T[tid] =  T[tid] + tauExactValue;     // Update time for each thread
	
	// Now save the simualtion data on arrays that will be back to host.
	
	
	
	// async_work_group_copy(des, src, size, event)
	async_work_group_copy(global_x, x, N, 0);
		 

}
	
	'