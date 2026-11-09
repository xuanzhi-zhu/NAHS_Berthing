function out = kappa_r0(x0,parameters)

k_o=parameters.k_o;
h_q=parameters.h_q;
h_o=parameters.h_o;
S=parameters.S;
J=parameters.J;
m_u=parameters.m_u;
m_nu=parameters.m_nu;

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
dod=fcn_dod(x0,parameters);
od=fcn_od(x0,parameters);
y=fcn_xi(xp,chi,parameters);

kappa_r0_ast=dod - k_o*(o-od) ...
        - h_q*1/h_o*Dh0_Dy(y,theta,parameters)*S*y;

out=J*kappa_r0_ast - (m_u-m_nu)*v(1)*v(2) - fcn_d_o(xp,parameters);


end

