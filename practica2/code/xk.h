//CPP:practica2/xk.cpp
#if !defined xk_h
#define xk_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class xk: public Simulator { 
// Declare the state,
// output variables
// and parameters
double x_k, sigma,y;

#define INF 1e7;
public:
	xk(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
