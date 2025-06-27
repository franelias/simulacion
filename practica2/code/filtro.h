//CPP:practica2/filtro.cpp
#if !defined filtro_h
#define filtro_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class filtro: public Simulator { 
// Declare the state,
// output variables
// and parameters

double sigma, p, job, seed;

#define INF 1e7
public:
	filtro(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
