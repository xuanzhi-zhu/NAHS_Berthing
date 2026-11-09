function out = fcn_dxi(x0,parameters)

S=parameters.S;
q_d=parameters.q_d;


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

alpha=fcn_alpha(xp,chi,parameters);
dalpha=fcn_dalpha(x0,parameters);

out=R(q)*S*o*(R(q_d))'*varphi(alpha) ...
       +R(q)*(R(q_d))'*Dvarphi(alpha)*dalpha;

end

