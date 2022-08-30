function [w1,w2,w3,w4] = int_potEn_bm_w(b, h, mu, lam, c1,c2,p,q,d1,d2,d3,d01,d02,d03,g,g0,k,k0)
% evaluate terms in the strain energy function

A=b*h;
I111111=(b*h^7/448)/A;
I222222=(b^7*h/448)/A;
I111112=0;
I11111=0;
I111122=(b^5/160*h^3/12)/A;
I11112=0;
I111222=0;
I11122=0;
I112222=(h^5/160*b^3/12)/A;
I11222=0;
I122222=0;
I12222=0;
I22222=0;

I2222=(b*h^5/80)/A;
I1111=(b^5*h/80)/A;
I1112=0;
I111=0;
I1122=(b^3/12)*(h^3/12)/A;
I112=0;
I11=(b^3*h/12)/A;
I1222=0;
I122=0;
I12=0;
I1=0;
I222=0;
I22=(b*h^3/12)/A;
I2=0;

p1=p(1);
p2=p(2);
p3=p(3);

q1=q(1);
q2=q(2);
q3=q(3);

d11=d1(1);
d12=d1(2);
d13=d1(3);

d21=d2(1);
d22=d2(2);
d23=d2(3);

d31=d3(1);
d32=d3(2);
d33=d3(3);

d011=d01(1);
d012=d01(2);
d013=d01(3);

d021=d02(1);
d022=d02(2);
d023=d02(3);

d031=d03(1);
d032=d03(2);
d033=d03(3);

g1=g(1);
g2=g(2);
g3=g(3);

g01=g0(1);
g02=g0(2);
g03=g0(3);

k1=k(1);
k2=k(2);
k3=k(3);

k01=k0(1);
k02=k0(2);
k03=k0(3);

%copy the symbolic expression here,replace the X1X2 with I12.
w1 = A*(((mu*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2))/2)*I11 + (-(mu*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)))/2)*I12 + ((mu*(2*d031*(d021*k03 + d031*k02) + 2*d032*(d022*k03 + d032*k02) + 2*d033*(d023*k03 + d033*k02) + 2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)))/2)*I1 + ((mu*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2))/2)*I22 + (-(mu*(2*d031*(d011*k03 - d031*k01) + 2*d032*(d012*k03 - d032*k01) + 2*d033*(d013*k03 - d033*k01) + 2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)))/2)*I2 + (mu*(g01^2 + 2*d031*g01 + g02^2 + 2*d032*g02 + g03^2 + 2*d033*g03))/2);

% ln(1+x)=1-x^2/2;
%w2 = A*((mu*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*I11)/2 - mu*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*I12 - mu*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*I1 + (mu*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*I22)/2 + mu*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*I2 - mu*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2));

%w3 = A*(((lam*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^4)/8)*I1111 + (-(lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/2)*I1112 + (-(lam*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))/2)*I111 + ((3*lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2)/4)*I1122 + ((lam*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)) + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))))/2)*I112 + (-(lam*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2) - (d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2))/2)*I11 + (-(lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))/2)*I122 + (-(lam*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))))/2)*I122 + (-(lam*(2*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2)))/2)*I12 + lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2)*(d31*(d21*k3 + d31*k2) - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*I1 + ((lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^4)/8)*I2222 + ((lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)))/2)*I222 + (-(lam*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2) - (d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2))/2)*I22 + (-lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2)*(d31*(d11*k3 - d31*k1) - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)))*I2 + (lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2)^2)/2);

w4 = A*(c2*q1^2*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2)*I1111 + (-c2*(q1^2*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)) - 2*q1*q2*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2)))*I1112 + c2*(2*q1^2*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + q1^2*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)) + 2*p3*q1*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2))*I111 + c2*(q1^2*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2) + q2^2*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2) - 2*q1*q2*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)))*I1122 + (-c2*(q1^2*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)) + 2*q1*(q1*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02))) - 2*q1*q2*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + 2*p3*q1*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)) - 2*q1*q2*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)) - 2*p3*q2*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2)))*I112 + (c2*(p3^2*((d021*k03 + d031*k02)^2 + (d022*k03 + d032*k02)^2 + (d023*k03 + d033*k02)^2) + q1^2*(g01^2 + g02^2 + g03^2 + 1) + 2*q1*(p1*(d011*(d021*k03 + d031*k02) + d012*(d022*k03 + d032*k02) + d013*(d023*k03 + d033*k02)) + p2*(d021*(d021*k03 + d031*k02) + d022*(d022*k03 + d032*k02) + d023*(d023*k03 + d033*k02)) + p3*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + q1*(d031*g01 + d032*g02 + d033*g03)) + 2*p3*q1*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + 2*p3*q1*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02))) + c1*q1^2)*I11 + (-c2*(q2^2*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)) - 2*q1*q2*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2)))*I1222 + (-c2*(2*q2*(q1*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02))) - q2^2*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)) + 2*q1*q2*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) + 2*p3*q2*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)) + 2*q1*q2*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)) - 2*p3*q1*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2)))*I122 + (2*c1*q1*q2 - c2*(p3^2*(2*(d011*k03 - d031*k01)*(d021*k03 + d031*k02) + 2*(d012*k03 - d032*k01)*(d022*k03 + d032*k02) + 2*(d013*k03 - d033*k01)*(d023*k03 + d033*k02)) + 2*p3*(q1*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02))) + 2*q1*(p1*(d011*(d011*k03 - d031*k01) + d012*(d012*k03 - d032*k01) + d013*(d013*k03 - d033*k01)) + p2*(d021*(d011*k03 - d031*k01) + d022*(d012*k03 - d032*k01) + d023*(d013*k03 - d033*k01)) + p3*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*g01 + d032*g02 + d033*g03)) - 2*q2*(p1*(d011*(d021*k03 + d031*k02) + d012*(d022*k03 + d032*k02) + d013*(d023*k03 + d033*k02)) + p2*(d021*(d021*k03 + d031*k02) + d022*(d022*k03 + d032*k02) + d023*(d023*k03 + d033*k02)) + p3*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + q1*(d031*g01 + d032*g02 + d033*g03)) + 2*p3*q1*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)) - 2*p3*q2*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)) - 2*q1*q2*(g01^2 + g02^2 + g03^2 + 1)))*I12 + (c2*(p3^2*(2*g01*(d021*k03 + d031*k02) + 2*g02*(d022*k03 + d032*k02) + 2*g03*(d023*k03 + d033*k02)) + 2*q1*(p1*(d011*g01 + d012*g02 + d013*g03) + p2*(d021*g01 + d022*g02 + d023*g03) + p3*(d031*g01 + d032*g02 + d033*g03)) + 2*p3*(p1*(d011*(d021*k03 + d031*k02) + d012*(d022*k03 + d032*k02) + d013*(d023*k03 + d033*k02)) + p2*(d021*(d021*k03 + d031*k02) + d022*(d022*k03 + d032*k02) + d023*(d023*k03 + d033*k02)) + p3*(d031*(d021*k03 + d031*k02) + d032*(d022*k03 + d032*k02) + d033*(d023*k03 + d033*k02)) + q1*(d031*g01 + d032*g02 + d033*g03)) + 2*p3*q1*(g01^2 + g02^2 + g03^2 + 1)) + 2*c1*p3*q1)*I1 + c2*q2^2*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2)*I2222 + (-c2*(2*q2^2*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) + q2^2*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)) - 2*p3*q2*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2)))*I222 + (c1*q2^2 - c2*(2*q2*(p1*(d011*(d011*k03 - d031*k01) + d012*(d012*k03 - d032*k01) + d013*(d013*k03 - d033*k01)) + p2*(d021*(d011*k03 - d031*k01) + d022*(d012*k03 - d032*k01) + d023*(d013*k03 - d033*k01)) + p3*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*g01 + d032*g02 + d033*g03)) - q2^2*(g01^2 + g02^2 + g03^2 + 1) - p3^2*((d011*k03 - d031*k01)^2 + (d012*k03 - d032*k01)^2 + (d013*k03 - d033*k01)^2) + 2*p3*q2*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) + 2*p3*q2*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01))))*I22 + (2*c1*p3*q2 - c2*(p3^2*(2*g01*(d011*k03 - d031*k01) + 2*g02*(d012*k03 - d032*k01) + 2*g03*(d013*k03 - d033*k01)) - 2*q2*(p1*(d011*g01 + d012*g02 + d013*g03) + p2*(d021*g01 + d022*g02 + d023*g03) + p3*(d031*g01 + d032*g02 + d033*g03)) + 2*p3*(p1*(d011*(d011*k03 - d031*k01) + d012*(d012*k03 - d032*k01) + d013*(d013*k03 - d033*k01)) + p2*(d021*(d011*k03 - d031*k01) + d022*(d012*k03 - d032*k01) + d023*(d013*k03 - d033*k01)) + p3*(d031*(d011*k03 - d031*k01) + d032*(d012*k03 - d032*k01) + d033*(d013*k03 - d033*k01)) - q2*(d031*g01 + d032*g02 + d033*g03)) - 2*p3*q2*(g01^2 + g02^2 + g03^2 + 1)))*I2 + c1*(p1^2 + p2^2 + p3^2) + c2*(2*p3*(p1*(d011*g01 + d012*g02 + d013*g03) + p2*(d021*g01 + d022*g02 + d023*g03) + p3*(d031*g01 + d032*g02 + d033*g03)) + p1^2 + p2^2 + p3^2*(g01^2 + g02^2 + g03^2 + 1)));

% ln(1+x)=1-x^2/2+x^3/3;
w2 = A*((-(mu*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/3)*I111 + mu*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*I112 + mu*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*I11 + (-mu*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))*I122 + (-mu*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)))*I12 + (-mu*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))*I1 + ((mu*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3)/3)*I222 + mu*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*I22 + mu*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*I2 - mu*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3));

w3 = A*((lam*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^6)/18*I111111 + (-(lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^5)/3)*I111112 + (-(lam*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/3)*I11111 + (5*lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^4)/6*I111122 + (lam*((2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/3 + 2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2))/2*I11112 + (lam*((2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))/3 + ((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))^2))/2*I1111 + (-(10*lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/9)*I111222 + (-(lam*((2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3)/3 + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2 + 2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))))/2)*I11122 + (-(lam*((2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)))/3 + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3)) + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))))/2)*I1112 + (-(lam*(2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - (2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^3*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3))/3))/2)*I111 + (5*lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^4*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2)/6*I112222 + (lam*((2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3)/3 + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2))/2*I11222 + (lam*(2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3)) + ((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))^2 + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)) + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))))/2*I1122 + (lam*(2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) + 2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)))/2*I112 + (lam*(((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2 - 2*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2/2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)))/2*I11 + (-(lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^5*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))/3)*I122222 + (-(lam*((2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3)/3 + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))))/2)*I12222 + (-(lam*((2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)))/3 + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3)) + 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))))/2)*I1222 + (-(lam*(2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)) + 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)))/2)*I122 + (-(lam*(2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2)) - 2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3))*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)))/2)*I12 + lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)*((d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*(d31*g1 + d32*g2 + d33*g3) + d31*(d21*k3 + d31*k2) + d32*(d22*k3 + d32*k2) + d33*(d23*k3 + d33*k2))*I1 + (lam*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^6)/18*I222222 + (lam*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3)/3*I22222 + (lam*((2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)))/3 + ((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))^2))/2*I2222 + (lam*(2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)) - (2*(d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^3*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3))/3))/2*I222 + (lam*(((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2 - 2*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2/2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))^2*(d31*g1 + d32*g2 + d33*g3))*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)))/2*I22 + (-lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)*((d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3)^2 - (d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1))*(d31*g1 + d32*g2 + d33*g3) + d31*(d11*k3 - d31*k1) + d32*(d12*k3 - d32*k1) + d33*(d13*k3 - d33*k1)))*I2 + (lam*(d31*g1 + d32*g2 + d33*g3 - (d31*g1 + d32*g2 + d33*g3)^2/2 + (d31*g1 + d32*g2 + d33*g3)^3/3)^2)/2);

end
