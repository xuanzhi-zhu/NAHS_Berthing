function out = fcn_dV0(x0,parameters)

h_p=parameters.h_p;
D_v=parameters.D_v;
M=parameters.M;

h_o=parameters.h_o;
k_o=parameters.k_o;

h_q=parameters.h_q;
k_q=parameters.k_q;

S=parameters.S;
e1=parameters.e1;
J=parameters.J;
m_u=parameters.m_u;
m_nu=parameters.m_nu;
d_u=parameters.d_u;
k_u=parameters.k_u;
d_nu=parameters.d_nu;

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


Lambda=[zeros(2,2),                R(q)*(0.5.*sqrt(h_p).*D_v-h_p.*eye(2)); ...
               (0.5.*sqrt(h_p).*D_v-h_p.*eye(2))*(R(q))',   M*(D_v-sqrt(h_p).*eye(2))];


od=fcn_od(x0,parameters);

y=fcn_xi(xp,chi,parameters);

% %%%
% out=-[p;v]'*Lambda*[p;v] ...
%        -h_o.*k_o.*(o-od)^2 ...
%        -h_q.*k_q.*(Dh0_Dy(y,theta,parameters)*S*y)^2;

% % %============
% % V0=0.5.*[p;v]'*H*[p;v] ...
% %     + h_q.*h0 ...
% %     + 0.5.*h_o.*(o-od)^2;
% % %============

%%% dp dq dv do correct

%%%time derivative of 0.5.*[p;v]'*H*[p;v]
% dp=R(q)*v;
% tau_u=kappa_u0(xp,parameters);
% dv=M\(-S*M*v*o+fcn_d_v(xp,parameters)+tau_u.*e1);
% dH=[zeros(2),            sqrt(h_p).*R(q)*S*o*M; ...
%          sqrt(h_p).*M*(R(q)*S*o)',  zeros(2)];
% H=fcn_H(q,parameters);

% out=0.5.*[dp;dv]'*H*[p;v] ... 
%        +0.5.*[p;v]'*dH*[p;v] ...
%        +0.5.*[p;v]'*H*[dp;dv];

%correct
% out=v'*(sqrt(h_p).*M-M*D_v)*v + p'*(2.*h_p.*R(q)-sqrt(h_p).*R(q)*D_v)*v ...
%        -c1.*sqrt(h_p).*(q'*p)^2 - c2.*sqrt(h_p).*(q'*p)*v(1) ...
%        -c1.*m_u.*(q'*p)*v(1) - c2.*m_u.*(v(1))^2;

tp=R(q)'*p;
tv=sqrt(h_p).*R(q)'*p + M*v;

% dtp=-o*S*tp+v;
% dtv=-o*S*tv-D_v*v+tau_u*e1+sqrt(h_p)*v;

% out=h_p*tp'*dtp + tv'*dtv;

% out=h_p*tp'*v - tv'*D_v*v + sqrt(h_p)*tv'*v + tv'*tau_u*e1;

% out=-[tp;tv]'*[h_p^(1.5)*inv(M), -0.5*sqrt(h_p)*inv(M)*D_v; ...
%                       -0.5*sqrt(h_p)*inv(M)*D_v, (D_v-sqrt(h_p)*eye(2))*inv(M)]*[tp;tv] + tau_u.*e1'*tv;


% tau_u=-sqrt(h_p)*1/m_u*d_u*tp(1)-k_u*tv(1);
% out=-[p;v]'*Lambda*[p;v] + tau_u.*e1'*tv;

% out=-[tp(2);tv(2)]'*[h_p^(1.5)*inv(m_nu), -0.5*sqrt(h_p)*inv(m_nu)*d_nu; ...
%           -0.5*sqrt(h_p)*inv(m_nu)*d_nu, inv(m_nu)*(d_nu-sqrt(h_p))]*[tp(2);tv(2)] ...
%           -(tp(1))^2*h_p^(1.5)*inv(m_u) - (tv(1))^2*(k_u+inv(m_u)*d_u-sqrt(h_p)*inv(m_u));

% out=-[tp(2);tv(2)]'*[1/8*d_nu^3*inv(m_nu), -1/4*d_nu^2*inv(m_nu); ...
%           -1/4*d_nu^2*inv(m_nu), 1/2*d_nu*inv(m_nu)]*[tp(2);tv(2)] ...
%           -(tp(1))^2*1/8*d_nu^3*inv(m_u) - (tv(1))^2*(k_u+inv(m_u)*d_u-inv(m_u)*1/2*d_nu);

% out=-[tp(2);tv(2)]'*[1/8*d_nu^3*inv(m_nu), -1/4*d_nu^2*inv(m_nu); ...
%           -1/4*d_nu^2*inv(m_nu), 1/2*d_nu*inv(m_nu)]*[tp(2);tv(2)] ...
%           -(tp(1))^2*1/8*d_nu^3*inv(m_u) - (tv(1))^2*(k_u+inv(m_u)*d_u-inv(m_u)*1/2*d_nu);

out=-1/8*inv(m_nu)*d_nu*(d_nu*tp(2)-2*tv(2))^2 ...
          -(tp(1))^2*1/8*d_nu^3*inv(m_u) - (tv(1))^2*(k_u+inv(m_u)*d_u-inv(m_u)*1/2*d_nu) ...
          -h_o.*k_o.*(o-od)^2 ...
          -h_q.*k_q.*(Dh0_Dy(y,theta,parameters)*S*y)^2;


end

