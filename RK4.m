clc;                                              
clear all;
F = @(t,y) 4*exp(0.8*t)-0.5*y 
t0=input('Enter the value of t0 :  \n');
y0=input('Enter the value of y0 :  \n');
tn=input('Enter the value of t for which you want to find the value of y :  \n');
h=input('Enter the step length :  \n');                                      
i=0;
while i<tn
    k_1 = F(t0,y0);
    k_2 = F(t0+0.5*h,y0+0.5*h*k_1);
    k_3 = F((t0+0.5*h),(y0+0.5*h*k_2));
    k_4 = F(((t0)+h),(y0+k_3*h));
    nexty = y0 + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
    y0=nexty;
    t0=t0+h;
    i=i+h;
end 
fprintf('The value of y at t=%f is %f \n',t0,y0)
% validate using a decent ODE integrator  
tspan = [0,1]; Y0 = 2;
[tx,yx] = ode45(F, tspan, Y0);
fprintf('The true value of y at t=%f is %f \n',tspan(end),yx(end))
Et= (abs(yx(end)-y0)/yx(end))*100;
fprintf('The  value of error Et at t=%f is %f%% \n',tspan(end),Et)