function out = fcn_dod(x0,parameters)

k_q=parameters.k_q;
q_ast=parameters.q_ast;
S=parameters.S;
r=parameters.r;
M=parameters.M;
e1=parameters.e1;
varpi=parameters.varpi;

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
tau_u=kappa_u0(xp,parameters);
dv=M\(-S*M*v*o+fcn_d_v(xp,parameters)+tau_u.*e1);

xi=fcn_xi(xp,chi,parameters);
dxi=fcn_dxi(x0,parameters);
dDh_ast=DDh_ast(xi'*r,parameters)*r'*dxi;
Drho_=Drho(p,parameters);
dDrho=transpose(DDrho(p,parameters)*R(q)*v);
dchi=f_chi(chi,parameters);
ddalpha=dDrho*R(q)*v*chi(1) + Drho_*R(q)*S*v*o*chi(1) ...
              +Drho_*R(q)*dv*chi(1) +  Drho_*R(q)*v*e1'*dchi ...
              +Drho_*R(q)*v*e1'*dchi + rho(p,parameters)*e1'*S*dchi*varpi;

%od=k_q.*(1-theta).*q_ast'*S*xi - k_q.*theta.*Dh_ast(xi'*r,parameters).*r'*S*xi -dalpha

out=k_q.*(1-theta).*q_ast'*S*dxi ...
       - k_q.*theta.*dDh_ast.*r'*S*xi ...
       - k_q.*theta.*Dh_ast(xi'*r,parameters).*r'*S*dxi ...
       - ddalpha;

end

