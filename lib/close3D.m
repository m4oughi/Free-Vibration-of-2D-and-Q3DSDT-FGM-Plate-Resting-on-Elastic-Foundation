clear all
clc

syms x y z
syms p Ec Em Roc Rom b total_a h n ax ay axy

disp("Quasi-3D")

m = 1;
noo = 0.3;

Ro = (Roc-Rom)*(((z/h)+0.5)^0.5)+Rom;

a = total_a/n;

N1 = (2.*x-a).*(x-a)./(a.^2);
N2 = (4.*x.*(a-x)./(a.^2));
N3 = (x.*(2.*x-a))./(a.^2);

F1 = 1-(3.*(x./a).^2)+(2.*(x./a).^3);
F3 = (3.*(x./a).^2)-(2.*(x./a).^3);
H1 = x.*(1-2.*(x./a)+(x./a).^2);
H3 = x.*(-(x./a)+(x./a).^2);

s = sin(m.*pi.*y./b);
c = cos(m.*pi.*y./b);

f = (((h/pi)*sinh(pi/h*z))-z)/(floor(cosh((pi/2)-1)));

N = [
    N1*s   0   -z*diff(F1, x)*s   -z*diff(H1, x)*s   -f*diff(F1, x)*s   -f*diff(H1, x)*s   0   0            N2*s   0          N3*s   0   -z*diff(F3, x)*s   -z*diff(H3, x)*s   -f*diff(F3, x)*s   -f*diff(H3, x)*s   0   0;
    0   N1*c   -z*F1*diff(s, y)   -z*H1*diff(s, y)   -f*F1*diff(s, y)   -f*H1*diff(s, y)   0   0            0   N2*c          0   N3*c   -z*F3*diff(s, y)   -z*H3*diff(s, y)   -f*F3*diff(s, y)   -f*H3*diff(s, y)   0   0;
    0   0   F1*s   H1*s   F1*s   H1*s   (1-diff(f, z))*F1*s   (1-diff(f, z))*H1*s                           0   0             0   0   F3*s   H3*s   F3*s   H3*s   (1-diff(f, z))*F3*s   (1-diff(f, z))*H3*s;
    ];

m_local = int( int( int( N.'*Ro*N , x, 0, a), y, 0, b), z, -0.5*h, 0.5*h);
disp("m_local")
save("mLocal3DP05.mat", "m_local")


beep on
beep