//CPP:practica2/muestreador.cpp
#if !defined muestreador_h
#define muestreador_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class muestreador: public Simulator { 
// Declare the state,
// output variables
// and parameters
double job, T, sigma, y;

#define INF 1e7
public:
	muestreador(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
