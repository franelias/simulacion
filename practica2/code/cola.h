//CPP:practica2/cola.cpp
#if !defined cola_h
#define cola_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"

#include "queue"


class cola: public Simulator { 
// Declare the state,
// output variables
// and parameters
bool busy;
double sigma, job;
std::queue<double> q;

#define INF 1e7

public:
	cola(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
