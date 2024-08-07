function kw_local = kwLocal3D(p, Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari)
if p==0
    data = load('kwLocal3DP0.mat');
elseif p==0.5
    data = load('kwLocal3DP05.mat');
elseif p==1
    data = load('kwLocal3DP1.mat');
elseif p==2
    data = load('kwLocal3DP2.mat');    
elseif p==3
    data = load('kwLocal3DP3.mat');    
elseif p==4
    data = load('kwLocal3DP4.mat');
elseif p==5
    data = load('kwLocal3DP5.mat');
elseif p==10
    data = load('kwLocal3DP10.mat');
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

kw_local = data.kw_local;
values = {Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari};

kw_local = subs(kw_local, {Ec, Em, noo, b, total_a, h, n, ax, ay, axy, kw_bar, ks_bar}, values);
kw_local = double(kw_local);
end