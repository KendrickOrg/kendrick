as yet unclassified
acceptKEModel: arg1
	| tmp1 tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 tmp22 tmp24 tmp26 tmp28 tmp30 tmp32 tmp34 tmp36 tmp38 tmp40 tmp42 tmp44 tmp46 tmp48 tmp50 tmp52 tmp54 tmp56 tmp58 tmp60 tmp62 tmp64 tmp66 tmp68 tmp70 tmp72 tmp74 tmp76 tmp78 tmp80 tmp82 tmp84 tmp86 tmp88 tmp90 tmp92 tmp94 tmp96 tmp98 tmp100 tmp102 tmp104 tmp106 tmp108 tmp110 tmp112 tmp114 tmp116 tmp118 tmp120 tmp122 tmp124 tmp126 tmp128 tmp130 tmp132 tmp134 tmp136 tmp138 tmp140 tmp142 tmp144 tmp146 tmp148 tmp150 tmp152 tmp154 tmp156 tmp158 tmp160 tmp162 tmp164 tmp166 tmp168 tmp170 tmp172 tmp174 tmp176 tmp178 tmp180 tmp182 tmp184 tmp186 tmp188 tmp190 tmp192 tmp194 tmp196 |
	numberOfEvent := 0.
	tmp2 := self getFileName: arg1.
	tmp1 := FileSystem disk workingDirectory.
	stream := (tmp1 / tmp2) writeStream.
	self prepareCPPFile.
	isDeterministic := false.
	tmp4 := stream.
	tmp4
		nextPutAll: 'const double TMAX = ' , arg1 simulator tMax asFloat asString , ';';
		cr.
	tmp6 := stream.
	tmp6
		nextPutAll: 'const double TMIN = ' , arg1 simulator tMin asFloat asString , ';';
		cr.
	tmp8 := stream.
	tmp8
		nextPutAll: 'const double STEP = ' , arg1 simulator step asFloat asString , ';';
		cr.
	tmp10 := stream.
	tmp10
		nextPutAll: 'const int NB_EVENTS = ' , arg1 eventList size asString , ';';
		cr;
		cr.
	tmp12 := stream.
	tmp12
		nextPutAll:
			'const int nbOfCompartments = ' , arg1 numberOfCompartments asString
				, ';';
		cr.
	tmp14 := stream.
	tmp14
		nextPutAll: 'const int nbOfSpecies = ' , arg1 numberOfSpecies asString , ';';
		cr;
		cr.
	tmp16 := stream.
	tmp16
		nextPutAll: 'double t = TMIN;';
		cr.
	tmp18 := stream.
	tmp18
		nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';
		cr.
	tmp20 := stream.
	tmp20
		nextPutAll: 'string compartmentName[nbOfCompartments];';
		cr.
	tmp22 := stream.
	tmp22
		nextPutAll: 'double x[nbOfCompartments][nbOfSpecies];';
		cr.
	tmp24 := stream.
	tmp24
		nextPutAll: 'double rates[NB_EVENTS];';
		cr;
		cr.
	arg1 parameters
		do: [ :arg2 | stream nextPutAll: (self visitNode: arg2) ].
	tmp26 := stream.
	tmp26
		nextPutAll: 'void initializeCompartments()';
		cr.
	tmp28 := stream.
	tmp28
		nextPutAll: '{';
		cr.
	arg1 compartments
		do: [ :arg3 | stream nextPutAll: (self visitNode: arg3) ].
	tmp30 := stream.
	tmp30
		nextPutAll: '}';
		cr.
	tmp32 := stream.
	tmp32
		nextPutAll: 'double sum(double a[], int n) {';
		cr.
	tmp34 := stream.
	tmp34
		nextPutAll: String tab , 'double s=0.0;';
		cr.
	tmp36 := stream.
	tmp36
		nextPutAll: String tab , 'for (int i=0; i < n; i++)';
		cr.
	tmp38 := stream.
	tmp38
		nextPutAll: String tab , String tab , 's += a[i];';
		cr.
	tmp40 := stream.
	tmp40
		nextPutAll: String tab , 'return s;';
		cr.
	tmp42 := stream.
	tmp42
		nextPutAll: '}';
		cr.
	tmp44 := stream.
	tmp44
		nextPutAll: 'int selectEvent(double sumOfRates, double r) {';
		cr.
	tmp46 := stream.
	tmp46
		nextPutAll: String tab , 'int event = -1;';
		cr.
	tmp48 := stream.
	tmp48
		nextPutAll: String tab , 'double sp = 0.0;';
		cr.
	tmp50 := stream.
	tmp50
		nextPutAll: String tab , 'double p = 0.0;';
		cr.
	tmp52 := stream.
	tmp52
		nextPutAll: String tab , 'p = r * sumOfRates;';
		cr.
	tmp54 := stream.
	tmp54
		nextPutAll: String tab , 'for (int i = 0; i < NB_EVENTS; i++) {';
		cr.
	tmp56 := stream.
	tmp56
		nextPutAll: String tab , String tab , 'sp += rates[i];';
		cr.
	tmp58 := stream.
	tmp58
		nextPutAll: String tab , String tab , 'if (p <= sp) {';
		cr.
	tmp60 := stream.
	tmp60
		nextPutAll: String tab , String tab , String tab , 'event = i;';
		cr.
	tmp62 := stream.
	tmp62
		nextPutAll: String tab , String tab , String tab , 'break;';
		cr.
	tmp64 := stream.
	tmp64
		nextPutAll: String tab , String tab , '}';
		cr.
	tmp66 := stream.
	tmp66
		nextPutAll: String tab , '}';
		cr.
	tmp68 := stream.
	tmp68
		nextPutAll: String tab , 'return event;';
		cr.
	tmp70 := stream.
	tmp70
		nextPutAll: '}';
		cr.
	tmp72 := strInitializeTrans.
	tmp72
		nextPutAll: 'void Transition(int pEvent)';
		cr.
	tmp74 := strInitializeTrans.
	tmp74
		nextPutAll: '{';
		cr.
	tmp76 := strInitializeTrans.
	tmp76
		nextPutAll: String tab , 'switch(pEvent) {';
		cr.
	tmp78 := stream.
	tmp78
		nextPutAll: 'void calculateRate()';
		cr.
	tmp80 := stream.
	tmp80
		nextPutAll: '{';
		cr.
	arg1 eventList
		do: [ :arg4 | stream nextPutAll: (self visitNode: arg4) ].
	tmp82 := stream.
	tmp82
		nextPutAll: '}';
		cr.
	tmp84 := strInitializeTrans.
	tmp84
		nextPutAll: String tab , String tab , 'default: cout<<"Error"<<endl;';
		cr.
	tmp86 := strInitializeTrans.
	tmp86
		nextPutAll: String tab , String tab , String tab , 'break;';
		cr.
	tmp88 := strInitializeTrans.
	tmp88
		nextPutAll: String tab , '}';
		cr.
	tmp90 := strInitializeTrans.
	tmp90
		nextPutAll: '}';
		cr.
	stream nextPutAll: strInitializeTrans contents.
	tmp92 := stream.
	tmp92
		nextPutAll: 'int main(int argc, char *argv[]){';
		cr.
	tmp94 := stream.
	tmp94
		nextPutAll: String tab , 'double sumOfRates = 0.0;';
		cr.
	tmp96 := stream.
	tmp96
		nextPutAll: String tab , 'double previousTime = TMIN;';
		cr.
	tmp98 := stream.
	tmp98
		nextPutAll: String tab , 'double r1 = 0.0;';
		cr.
	tmp100 := stream.
	tmp100
		nextPutAll: String tab , 'double r2 = 0.0;';
		cr.
	tmp102 := stream.
	tmp102
		nextPutAll: String tab , 'int event = -1;';
		cr.
	tmp104 := stream.
	tmp104
		nextPutAll: String tab , 'double tOffset = 0.0;';
		cr.
	tmp106 := stream.
	tmp106
		nextPutAll: String tab , '//Initialize all values of x';
		cr.
	tmp108 := stream.
	tmp108
		nextPutAll: String tab , 'initializeCompartments();';
		cr.
	tmp110 := stream.
	tmp110
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp112 := stream.
	tmp112
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	tmp114 := stream.
	tmp114
		nextPutAll: String tab , String tab , String tab , 'x[i][j] = initialValue[i][j];';
		cr.
	tmp116 := stream.
	tmp116
		nextPutAll: String tab , '//prepare file for saving data';
		cr.
	tmp118 := stream.
	tmp118
		nextPutAll: String tab , 'stringstream fname;';
		cr.
	tmp120 := stream.
	tmp120
		nextPutAll: String tab , 'fname << "data_";';
		cr.
	tmp122 := stream.
	tmp122
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp124 := stream.
	tmp124
		nextPutAll: String tab , String tab , 'fname << compartmentName[i];';
		cr.
	tmp126 := stream.
	tmp126
		nextPutAll: String tab , 'fname << "_stc.dat";';
		cr.
	tmp128 := stream.
	tmp128
		nextPutAll: String tab , 'ofstream f(fname.str().data());';
		cr.
	tmp130 := stream.
	tmp130
		nextPutAll: String tab , 'cout << "Starting..." << endl;';
		cr.
	tmp132 := stream.
	tmp132
		nextPutAll: String tab , 'srand(time(0));';
		cr.
	tmp134 := stream.
	tmp134
		nextPutAll: String tab , '//Begin of algorithm Gillespie';
		cr.
	tmp136 := stream.
	tmp136
		nextPutAll: String tab , 'if (f.is_open())';
		cr.
	tmp138 := stream.
	tmp138
		nextPutAll: String tab , '{';
		cr.
	tmp140 := stream.
	tmp140
		nextPutAll: String tab , String tab , 'while (t < TMAX) {';
		cr.
	tmp142 := stream.
	tmp142
		nextPutAll: String tab , String tab , String tab , '//calculation of rates';
		cr.
	tmp144 := stream.
	tmp144
		nextPutAll: String tab , String tab , String tab , 'calculateRate();';
		cr.
	tmp146 := stream.
	tmp146
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < NB_EVENTS; i++)';
		cr.
	tmp148 := stream.
	tmp148
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'if (rates[i] < 0)';
		cr.
	tmp150 := stream.
	tmp150
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'rates[i] = rates[i]*(-1);';
		cr.
	tmp152 := stream.
	tmp152
		nextPutAll: String tab , String tab , String tab , '//Sum of rates';
		cr.
	tmp154 := stream.
	tmp154
		nextPutAll:
			String tab , String tab , String tab
				, 'sumOfRates = sum(rates, NB_EVENTS);';
		cr.
	tmp156 := stream.
	tmp156
		nextPutAll:
			String tab , String tab , String tab
				, '//Generation of time for the next calculation';
		cr.
	tmp158 := stream.
	tmp158
		nextPutAll: String tab , String tab , String tab , 'r1 = (double)rand()/RAND_MAX;';
		cr.
	tmp160 := stream.
	tmp160
		nextPutAll: String tab , String tab , String tab , 'r2 = (double)rand()/RAND_MAX;';
		cr.
	tmp162 := stream.
	tmp162
		nextPutAll:
			String tab , String tab , String tab
				, 'tOffset = (-1/sumOfRates)*log(r1);';
		cr.
	tmp164 := stream.
	tmp164
		nextPutAll: String tab , String tab , String tab , '//select event';
		cr.
	tmp166 := stream.
	tmp166
		nextPutAll:
			String tab , String tab , String tab
				, 'event = selectEvent(sumOfRates, r2);';
		cr.
	tmp168 := stream.
	tmp168
		nextPutAll: String tab , String tab , String tab , 'Transition(event);';
		cr.
	tmp170 := stream.
	tmp170
		nextPutAll:
			String tab , String tab , String tab
				, 'if (t > (previousTime + STEP)){';
		cr.
	tmp172 := stream.
	tmp172
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'f << t << ''\t'';';
		cr.
	tmp174 := stream.
	tmp174
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'for (int i = 0; i < nbOfCompartments; i++)';
		cr.
	tmp176 := stream.
	tmp176
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'for (int j = 0; j < nbOfSpecies; j++)';
		cr.
	tmp178 := stream.
	tmp178
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, String tab , 'f << ' , function asString
				, '(x[i][j]) << ''\t'';';
		cr.
	tmp180 := stream.
	tmp180
		nextPutAll: String tab , String tab , String tab , String tab , 'f << ''\n'';';
		cr.
	tmp182 := stream.
	tmp182
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'previousTime = t;';
		cr.
	tmp184 := stream.
	tmp184
		nextPutAll: String tab , String tab , String tab , '}';
		cr.
	tmp186 := stream.
	tmp186
		nextPutAll: String tab , String tab , String tab , 't += tOffset;';
		cr.
	tmp188 := stream.
	tmp188
		nextPutAll: String tab , String tab , '}';
		cr.
	tmp190 := stream.
	tmp190
		nextPutAll: String tab , String tab , 'f.close();';
		cr.
	tmp192 := stream.
	tmp192
		nextPutAll: String tab , '}';
		cr.
	tmp194 := stream.
	tmp194
		nextPutAll: String tab , 'cout << "Finished..." << endl;';
		cr.
	tmp196 := stream.
	tmp196
		nextPutAll: '}';
		cr.
	stream close