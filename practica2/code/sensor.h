//CPP:practica2/sensor.cpp
#if !defined sensor_h
#define sensor_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"



class sensor: public Simulator { 
// Declare the state,
// output variables
// and parameters
double count, sigma, job;

#define INF 1e7
public:
	sensor(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
