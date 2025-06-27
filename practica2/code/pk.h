//CPP:practica2/pk.cpp
#if !defined pk_h
#define pk_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class pk: public Simulator { 
// Declare the state,
// output variables
// and parameters

double sigma, y, k1, k2, p_k;
double e_k, x_k;

bool ek_def, xk_def;

#define INF 1e7
public:
	pk(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
