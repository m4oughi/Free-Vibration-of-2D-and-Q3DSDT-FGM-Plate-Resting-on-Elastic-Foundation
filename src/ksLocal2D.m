function ks_local = ksLocal2D(p, Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari)

if p==0
    data = load('ksLocal2DP0.mat');
elseif p==0.5
    data = load('ksLocal2DP05.mat');
elseif p==1
    data = load('ksLocal2DP1.mat');
elseif p==2
    data = load('ksLocal2DP2.mat');    
elseif p==3
    data = load('ksLocal2DP3.mat');    
elseif p==4
    data = load('ksLocal2DP4.mat');
elseif p==5
    data = load('ksLocal2DP5.mat');
elseif p==10
    data = load('ksLocal2DP10.mat');
else
end

Ec = sym('Ec');
Em = sym('Em');
noo = sym('noo');
b = sym('b');
total_a = sym('total_a');
h = sym('h');
n = sym('n');
ax = sym('ax');
ay = sym('ay');
axy = sym('axy');
kw_bar = sym('kw_bar');
ks_bar = sym('ks_bar');

ks_local = data.ks_local;
values = {Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari};

ks_local = subs(ks_local, {Ec, Em, noo, b, total_a, h, n, ax, ay, axy, kw_bar, ks_bar}, values);
ks_local = double(ks_local);
end