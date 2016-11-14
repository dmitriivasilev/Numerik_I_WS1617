clear all

format long
f = @(x) sin(2.*x).*exp(-x.^2)+1;


global c
c = [];

global iter
iter = 0;

adaptint(0,5,0.0001,f,'MR');
disp(ans)

disp( sprintf( '%d Iterationen', iter ) )
c = [c 0 5];
c = sort(c);
x = linspace(0,5,100);
t = f(x);
y = f(c);
plot(x,t);
hold on
plot (c,y,'-s');

