#include "ek.h"
void ek::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type
sigma = INF;
lref = va_arg(parameters, double);
e_k = 0;
}
double ek::ta(double t) {
//This function returns a double.
return sigma;
}
void ek::dint(double t) {
sigma = INF;
}
void ek::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition
e_k = lref - x.getDouble();
sigma = 0;

}
Event ek::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = e_k;
return Event(&y, 0);
}
void ek::exit() {
//Code executed at the end of the simulation.

}
