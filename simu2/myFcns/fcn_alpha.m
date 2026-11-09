function out=fcn_alpha(xp,chi,parameters)
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

out=rho(p,parameters)*chi(1);

end

