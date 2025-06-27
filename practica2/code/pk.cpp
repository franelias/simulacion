#include "pk.h"
void pk::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type

k1 = va_arg(parameters, double);
k2 = va_arg(parameters, double);
p_k = 1.0;
e_k = 0.0;
x_k = 0.0;
ek_def = false;
xk_def = false;
sigma = INF;

}
double pk::ta(double t) {
//This function returns a double.
return sigma;
}
void pk::dint(double t) {
p_k = k1*e_k + k2*x_k;
if(p_k < 0) {
	p_k = 0;
} else if(p_k > 1) {
	p_k = 1;
}
ek_def = false;
xk_def = false;
sigma = INF;
}
void pk::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition
if(x.port == 0) {
	x_k = x.getDouble();
	xk_def = true;
} else {
	e_k = x.getDouble();
	ek_def = true;
}

if(ek_def == true && xk_def == true) {
	sigma = 0;
}


}
Event pk::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = p_k;
return Event(&y, 0);
}
void pk::exit() {
//Code executed at the end of the simulation.

}
