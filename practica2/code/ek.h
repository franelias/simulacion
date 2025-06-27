//CPP:practica2/ek.cpp
#if !defined ek_h
#define ek_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class ek: public Simulator { 
// Declare the state,
// output variables
// and parameters
double e_k, sigma, y, lref;

#define INF 1e7
public:
	ek(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
