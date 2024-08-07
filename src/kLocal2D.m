function k_local = kLocal2D(p, Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari)

if p==0
    data = load('kLocal2DP0.mat');
elseif p==0.5
    disp("reading data ...");
    fprintf("<strong>Notice: I want to emphasize that it will take too long time to run p==0.5</strong> \n You can try another p. \n If you want to stop running, please use <strong>'Ctrl+C'</strong> \n Running ..." )
    data = load('kLocal2DP05.mat');
elseif p==1
    data = load('kLocal2DP1.mat');
elseif p==2
    data = load('kLocal2DP2.mat');
elseif p==3
    data = load('kLocal2DP3.mat');
elseif p==4
    data = load('kLocal2DP4.mat');
elseif p==5
    data = load('kLocal2DP5.mat');
elseif p==10
    data = load('kLocal2DP10.mat');
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

k_local = data.k_local;
values = {Eci, Emi, nooi, bi, total_ai, hi, ni, axi, ayi, axyi, kw_bari, ks_bari};

k_local = subs(k_local, {Ec, Em, noo, b, total_a, h, n, ax, ay, axy, kw_bar, ks_bar}, values);
k_local = double(k_local);
end

