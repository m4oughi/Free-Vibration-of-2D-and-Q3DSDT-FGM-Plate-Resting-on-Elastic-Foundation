function m_local = mLocal2D(p, Eci, Emi, Roci, Romi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari)

if p==0
    data = load('mLocal2DP0.mat');
elseif p==0.5
    data = load('mLocal2DP05.mat');
elseif p==1
    data = load('mLocal2DP1.mat');
elseif p==2
    data = load('mLocal2DP2.mat');    
elseif p==3
    data = load('mLocal2DP3.mat'); 
elseif p==4
    data = load('mLocal2DP4.mat');
elseif p==5
    data = load('mLocal2DP5.mat');
elseif p==10
    data = load('mLocal2DP10.mat');
else
end


Ec = sym('Ec');
Em = sym('Em');
Roc = sym('Roc');
Rom = sym('Rom');
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

m_local = data.m_local;
values = {Eci, Emi, Roci, Romi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari};

m_local = subs(m_local, {Ec, Em, Roc, Rom, noo, b, total_a, h, n, ax, ay, axy, kw_bar, ks_bar}, values);
m_local = double(m_local);
end
