#include "fuente.h"
void fuente::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type
Jmin = va_arg(parameters, double);
Jmax = va_arg(parameters, double);
Tmax = va_arg(parameters, double);
job = (Jmax - Jmin) * rand() / RAND_MAX;
sigma = (Tmax) * rand() / RAND_MAX;
}
double fuente::ta(double t) {
//This function returns a double.
return sigma;
}
void fuente::dint(double t) {
job = (Jmax - Jmin) * rand() / RAND_MAX;
sigma = (Tmax) * rand() / RAND_MAX;
}
void fuente::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition

}
Event fuente::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = job;
return Event(&y, 0);
}
void fuente::exit() {
//Code executed at the end of the simulation.

}
