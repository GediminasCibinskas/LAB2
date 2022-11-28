clear all;
clc;

mok=0.15;

% Paruošiami duomenis mokymui

x= 0:1/22:1;

y = 0.8*sin(2*pi*x)+ 0.3*cos(3*pi*x)/2;


% Sugeneruoti pradines ryšių svorių reikšmes
%pirmas sluoksnis
w11_1 = randn(1); b1_1 = randn(1);
w21_1 = randn(1); b2_1 = randn(1);
w31_1 = randn(1); b3_1 = randn(1);
w41_1 = randn(1); b4_1 = randn(1);
w51_1 = randn(1); b5_1 = randn(1);
w61_1 = randn(1); b6_1 = randn(1);
w71_1 = randn(1); b7_1 = randn(1);

%Antras sluoksnis
w11_2 = randn(1); b1_2 = randn(1);
w12_2 = randn(1);
w13_2 = randn(1);
w14_2 = randn(1);
w15_2 = randn(1);
w16_2 = randn(1);
w17_2 = randn(1);

% paskaičiuoti tinklo atsaką

for indx= 1:10000
for n= 1:20

v1_1 = x(n)*w11_1 + b1_1;
v2_1 = x(n)*w21_1 + b2_1;
v3_1 = x(n)*w31_1 + b3_1;
v4_1 = x(n)*w41_1 + b4_1;
v5_1 = x(n)*w51_1 + b5_1;
v6_1 = x(n)*w61_1 + b6_1;
v7_1 = x(n)*w71_1 + b7_1;

y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));
y6_1 = 1/(1+exp(-v6_1));
y7_1 = 1/(1+exp(-v7_1));

v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2;

y_apskaiciuotas = v1_2;

%palyginti su norimu atsaku ir apsakičiuoti klaidą

e = y(n) - y_apskaiciuotas;

% Atnaujinti ryšių svorius taip, kad klaida mažėtų

delta_out = e;

delta_1_1 = y1_1*(1-y1_1)*(delta_out*w11_2);
delta_2_1 = y2_1*(1-y2_1)*(delta_out*w12_2);
delta_3_1 = y3_1*(1-y3_1)*(delta_out*w13_2);
delta_4_1 = y4_1*(1-y4_1)*(delta_out*w14_2);
delta_5_1 = y5_1*(1-y5_1)*(delta_out*w15_2);
delta_6_1 = y6_1*(1-y6_1)*(delta_out*w16_2);
delta_7_1 = y7_1*(1-y7_1)*(delta_out*w17_2);

w11_2 = w11_2 + mok*delta_out*y1_1;
w12_2 = w12_2 + mok*delta_out*y2_1;
w13_2 = w13_2 + mok*delta_out*y3_1;
w14_2 = w14_2 + mok*delta_out*y4_1;
w15_2 = w15_2 + mok*delta_out*y5_1;
w16_2 = w16_2 + mok*delta_out*y6_1;
w17_2 = w17_2 + mok*delta_out*y7_1;
b1_2 = b1_2 + mok*delta_out;

w11_1 = w11_1 + mok*delta_1_1*x(n);
w21_1 = w21_1 + mok*delta_2_1*x(n);
w31_1 = w31_1 + mok*delta_3_1*x(n);
w41_1 = w41_1 + mok*delta_4_1*x(n);
w51_1 = w51_1 + mok*delta_5_1*x(n);
w61_1 = w61_1 + mok*delta_6_1*x(n);
w71_1 = w71_1 + mok*delta_7_1*x(n);
b1_1 = b1_1 + mok*delta_1_1;
b2_1 = b2_1 + mok*delta_2_1;
b3_1 = b3_1 + mok*delta_3_1;
b4_1 = b4_1 + mok*delta_4_1;
b5_1 = b5_1 + mok*delta_5_1;
b6_1 = b6_1 + mok*delta_6_1;
b7_1 = b7_1 + mok*delta_7_1;

end
end
%atvaizdavimas
x2=linspace(0,1,100);
for m= 1:100

v1_1 = x2(m)*w11_1 + b1_1;
v2_1 = x2(m)*w21_1 + b2_1;
v3_1 = x2(m)*w31_1 + b3_1;
v4_1 = x2(m)*w41_1 + b4_1;
v5_1 = x2(m)*w51_1 + b5_1;
v6_1 = x2(m)*w61_1 + b6_1;
v7_1 = x2(m)*w71_1 + b7_1;

y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));
y6_1 = 1/(1+exp(-v6_1));
y7_1 = 1/(1+exp(-v7_1));

v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2;

y_apskaiciuotas(m) = v1_2;
end
figure(1);
plot(x,y,'kx',x2,y_apskaiciuotas,'b*')