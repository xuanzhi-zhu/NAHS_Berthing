function out = ell_i(x0,i,parameters)

e1=parameters.e1;
vertices=parameters.vertices;
S=parameters.S;
M=parameters.M;
D_v=parameters.D_v;
J=parameters.J;
m_u=parameters.m_u;
m_nu=parameters.m_nu;
d_o=parameters.d_o;

%%%%%
xp=x0(1:7);
% state=x0(8:10);

%%%
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

% %%
% chi=state(1:2);
% theta=state(3);

%%%

p_i=vertices(:,i);

out=e1'*R(q)*( S*v*o - p_i*o*o - inv(M)*S*M*v*o - inv(M)*D_v*v ...
                        + 1/J*(m_u-m_nu)*v(1)*v(2)*S*p_i - 1/J*d_o*o*S*p_i);

end

