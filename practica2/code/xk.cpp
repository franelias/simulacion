#include "xk.h"
void xk::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type
sigma = INF;
x_k = 0;
}
double xk::ta(double t) {
//This function returns a double.
return sigma;
}
void xk::dint(double t) {
sigma = INF;

}
void xk::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition
x_k = x_k+x.getDouble();
sigma = 0;
}
Event xk::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = x_k;
return Event(&y, 0);
}
void xk::exit() {
//Code executed at the end of the simulation.

}
