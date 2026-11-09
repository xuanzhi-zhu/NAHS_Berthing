function out = kappa_u0(xp,parameters)

h_p=parameters.h_p;
d_u=parameters.d_u;
m_u=parameters.m_u;
k_u=parameters.k_u;

%%%
p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

%%%
out=-sqrt(h_p)*(1/m_u*d_u+k_u)*q'*p - k_u*m_u*v(1);


end

