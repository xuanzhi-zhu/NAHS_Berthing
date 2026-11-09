function out = fcn_dalpha(x0,parameters)

e1=parameters.e1;

%%%%%
xp=x0(1:7);
state=x0(8:10);

%%%
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

%%%
chi=state(1:2);
theta=state(3);

out=Drho(p,parameters)*R(q)*v*e1'*chi + rho(p,parameters)*e1'*f_chi(chi,parameters);

end

