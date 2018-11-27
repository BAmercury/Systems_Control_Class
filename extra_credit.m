close all
A = [-5.0];
B = [2.0]; 
C = [1.0];
D = [];
t = 0.01;
IC = 1;
% Forward Difference
Ad = expm(-5*t);
Ad2 = 1/expm(-5*t);
Bd = ((-2/5)*expm(-5*t)) + (2/5);
Bd2 = Ad*(Ad2)*B;
sys = ss(A,B,C,D);
initial(sys, IC)
hold on;

x = [];
y = [];
y(1) = 1;
Td = [];
Td(1) = 0;
% Forward difference
for i = 1:length(Tc)
    y(i+1) = Ad*y(i) +(Bd*0);
    Td(i+1) = i; % save corresponding discrete time integer index
end
hold on;
stem(Td*t,y, 'g', 'DisplayName', 'Forward Difference');
fwd_diff = y;

yd = [];
yd(1) = 1;
Td = [];
Td(1) = 0;
% Forward Difference
for i = 1:length(Tc)
    yd(i+1) = (1+(t*A))*yd(i) +(t*B*0);
    Td(i+1) = i;
end
yd
hold on;
stem(Td*t,yd, 'r o','DisplayName', 'Forward Difference');
yd = [];
yd(length(Tc)) = 1;
Td = [];
% Backward Difference
for i = length(Tc):-1:2
    yd(i-1) = (1-(t*A))*yd(i) -(t*B*0);
    Td(i) = length(Tc)-i;
end
yd
hold on;
stem(Td*t,yd, 'b o','DisplayName', 'Forward Difference');

    




    
    