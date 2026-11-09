function dxp=f_p(xp,control,parameters)
m_u=parameters.m_u;
m_nu=parameters.m_nu;
J=parameters.J;
M=parameters.M;
% d_u=parameters.d_u;
% d_nu=parameters.d_nu;
% D_v=parameters.D_v;
% d_o=parameters.d_o;
% 
% d=parameters.d;
% P=parameters.P;
% 
% N=parameters.N;
% bar_x=parameters.bar_x;
% Delta=parameters.Delta;

e1=parameters.e1;
% e2=parameters.e2;
S=parameters.S;

%%%%%

p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

%%%

tau_u=control(1);
tau_r=control(2);

%%%

dp=R(q)*v;
dq=S*q*o;
dv=M\(-S*M*v*o+fcn_d_v(xp,parameters)+tau_u.*e1);
do=J\((m_u-m_nu)*v(1)*v(2)+fcn_d_o(xp,parameters)+tau_r);

dxp=[dp;dq;dv;do];

end