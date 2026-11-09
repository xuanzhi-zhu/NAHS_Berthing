function out = fcn_V0(x0,parameters)

h_q=parameters.h_q;
h_o=parameters.h_o;

h_p=parameters.h_p;
M=parameters.M;

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

%%%

H=fcn_H(q,parameters);
xi=fcn_xi(xp,chi,parameters);
h0=fcn_h0(xi,theta,parameters);

od=fcn_od(x0,parameters);

out=0.5.*[p;v]'*H*[p;v] ...
    + h_q.*h0 ...
    + 0.5.*h_o.*(o-od)^2;

% tp=R(q)'*p;
% tv=sqrt(h_p).*R(q)'*p + M*v;
% 
% out=tv'*tv;

% out=0.5.*[p;v]'*H*[p;v];

end