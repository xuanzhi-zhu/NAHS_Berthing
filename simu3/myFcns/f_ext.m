function out = f_ext(state,xp,parameters)

M=parameters.M;
h_p=parameters.h_p;
h_o=parameters.h_o;
J=parameters.J;
gamma=parameters.gamma;

x0=[xp;state(1:3)];

%%%
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

%%%
chi=state(1:2);
% theta=state(3);
hb=state(4:6);

od=fcn_od(x0,parameters);

E1=v'*M*R(q)' + sqrt(h_p).*p' + h_o.*(o-od)*Drho(p,parameters)*R(q)*inv(M)*R(q)'*chi(1);
E2=h_o.*(o-od)*inv(J);

E=[E1 E2];

dhb=gamma.*proj(E',hb,parameters);

out=dhb;

end