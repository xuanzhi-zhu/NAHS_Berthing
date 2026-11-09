function out = fcn_hdod(x1,parameters)

k_q=parameters.k_q;
q_ast=parameters.q_ast;
S=parameters.S;
r=parameters.r;
M=parameters.M;
e1=parameters.e1;
varpi=parameters.varpi;


xp=x1(1:7);
xc=x1(8:10);
hb=x1(11:13);

x0=[xp;xc];

%%%
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

hb_v=hb(1:2);

%%%
chi=xc(1:2);
theta=xc(3);

%%%
tau_u=kappa_u1(x1,parameters);
hdv=M\(-S*M*v*o+fcn_d_v(xp,parameters)+tau_u.*e1 + R(q)'*hb_v);

xi=fcn_xi(xp,chi,parameters);
dxi=fcn_dxi(x0,parameters);
dDh_ast=DDh_ast(xi'*r,parameters)*r'*dxi;
Drho_=Drho(p,parameters);
dDrho=transpose(DDrho(p,parameters)*R(q)*v);
dchi=f_chi(chi,parameters);
hddalpha=dDrho*R(q)*v*chi(1) + Drho_*R(q)*S*v*o*chi(1) ...
              +Drho_*R(q)*hdv*chi(1) +  Drho_*R(q)*v*e1'*dchi ...
              +Drho_*R(q)*v*e1'*dchi + rho(p,parameters)*e1'*S*dchi*varpi;

%od=k_q.*(1-theta).*q_ast'*S*xi - k_q.*theta.*Dh_ast(xi'*r,parameters).*r'*S*xi -dalpha

out=k_q.*(1-theta).*q_ast'*S*dxi ...
       - k_q.*theta.*dDh_ast.*r'*S*xi ...
       - k_q.*theta.*Dh_ast(xi'*r,parameters).*r'*S*dxi ...
       - hddalpha;

end

