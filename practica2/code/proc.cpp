#include "proc.h"
void proc::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type
busy=false;
sigma=INF;
}
double proc::ta(double t) {
//This function returns a double.
return sigma;
}
void proc::dint(double t) {
busy=false;
sigma=INF;
}
void proc::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition
if (busy)
  sigma = sigma-e;
else {
  busy = true;
  sigma = x.getDouble();
}
}
Event proc::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = 1;
return Event(&y, 0);
}
void proc::exit() {
//Code executed at the end of the simulation.

}
