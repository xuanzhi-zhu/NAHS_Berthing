function out = fcn_xi(xp,chi,parameters)

q_d=parameters.q_d;


%%%
% p=xp(1:2);
q=xp(3:4);
% v=xp(5:6);
% o=xp(7);

alpha=fcn_alpha(xp,chi,parameters);

out=R(q)*(R(q_d))'*varphi(alpha);

end