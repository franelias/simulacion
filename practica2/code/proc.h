//CPP:practica2/proc.cpp
#if !defined proc_h
#define proc_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class proc: public Simulator { 
// Declare the state,
// output variables
// and parameters
bool busy;
double sigma, y;

#define INF 1e7
public:
	proc(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
